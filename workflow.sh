#!/usr/bin/env bash

mkdir tmp && 
cd tmp &&
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
mapshaper -i maakond.shp -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -sort 'MNIMI' -o geojson format=geojson &&
mapshaper -i omavalitsus.shp -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -sort 'ONIMI' -o geojson format=geojson &&
mapshaper -i asustusyksus.shp -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -sort 'ANIMI' -o geojson format=geojson &&
mapshaper -i maakond.shp -dissolve -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -o geojson/estonia.json &&
mkdir topojson &&
mapshaper -i maakond.shp -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -sort 'MNIMI' -o topojson format=topojson &&
mapshaper -i omavalitsus.shp -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -sort 'ONIMI' -o topojson format=topojson &&
mapshaper -i asustusyksus.shp -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -sort 'ANIMI' -o topojson format=topojson &&
mapshaper -i maakond.shp -dissolve -proj wgs84 -each 'AREA=this.originalArea' -simplify dp 5% -o topojson/estonia.json format=topojson &&
mkdir csv &&
mapshaper -i maakond.shp -each 'AREA=this.originalArea' -sort 'MNIMI' -o csv format=csv &&
mapshaper -i omavalitsus.shp -each 'AREA=this.originalArea' -sort 'ONIMI' -o csv format=csv &&
mapshaper -i asustusyksus.shp -each 'AREA=this.originalArea' -sort 'ANIMI' -o csv format=csv &&
mapshaper -i maakond.shp -dissolve -each 'AREA=this.originalArea' -o csv/estonia.csv format=csv &&
cd .. &&
rm -Rf geojson && 
mv tmp/geojson geojson &&
rm -Rf topojson && 
mv tmp/topojson topojson &&
rm -Rf csv && 
mv tmp/csv csv &&
rm -Rf tmp
