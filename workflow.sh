#!/usr/bin/env bash

curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/maakond_shp.zip" && 
mv maakond_shp.zip maakond.zip &&
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/omavalitsus_shp.zip" && 
mv omavalitsus_shp.zip omavalitsus.zip &&
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/asustusyksus_shp.zip" && 
mv asustusyksus_shp.zip asustusyksus.zip
// http://stackoverflow.com/a/25433574
for zip in *.zip; do
    zip_filename="${zip%%.*}"
    unzip "${zip}" -d "${zip_filename}-dir"

    for file in "${zip_filename}-dir"/*.*; do
        extension="${file##*.}"
        new_name="${zip_filename}.${extension}"
        mv "${file}" "${new_name}"
    done

    rmdir "${zip_filename}-dir"
    # delete the zip file
    # rm "${zip}"
done
mkdir geojson && 
mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o geojson format=geojson &&
mkdir topojson && 
mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o topojson format=topojson &&
mapshaper -i maakond.shp -dissolve -proj wgs84 -simplify dp 5% -o geojson/estonia.json &&
mapshaper -i maakond.shp -dissolve -proj wgs84 -simplify dp 5% -o topojson/estonia.json format=topojson &&
mkdir csv && 
mapshaper -i *.shp -o csv format=csv &&
mapshaper -i csv/maakond.csv -sort 'MNIMI' -o csv/maakond.csv &&
mapshaper -i csv/omavalitsus.csv -sort 'ONIMI' -o csv/omavalitsus.csv &&
mapshaper -i csv/asustusyksus.csv -sort 'ANIMI' -o csv/asustusyksus.csv
