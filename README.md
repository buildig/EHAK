# EHAK

Eesti haldus- ja asustusjaotuse klassifikaatori ruumiandmed CSV, [GeoJSON](http://geojson.org/) ja [TopoJSON](https://github.com/topojson/topojson) formaadis / Spatial data for Estonian Administrative and Settlement Classification in CSV, [GeoJSON](http://geojson.org/) and [TopoJSON](https://github.com/topojson/topojson) format. [Monthly releases](https://github.com/buildig/EHAK/releases).

Preview: https://buildig.com/EHAK

## Workflow

- Download shapefiles from [Maa-amet](http://geoportaal.maaamet.ee/eng/Maps-and-Data/Administrative-and-Settlement-Division-p312.html) and rename:
```
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/maakond_shp.zip" && 
mv maakond_shp.zip maakond.zip &&
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/omavalitsus_shp.zip" && 
mv omavalitsus_shp.zip omavalitsus.zip &&
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/asustusyksus_shp.zip" && 
mv asustusyksus_shp.zip asustusyksus.zip
```

- Unzip and rename extracted files:
```
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
```

- Transform shapefiles to json and csv format using [mapshaper](http://www.mapshaper.org/):
```
mkdir geojson && 
mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o geojson format=geojson &&
mkdir topojson && 
mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o topojson format=topojson &&
mapshaper -i maakond.shp -dissolve -proj wgs84 -simplify dp 5% -o geojson/estonia.json &&
mapshaper -i maakond.shp -dissolve -proj wgs84 -simplify dp 5% -o topojson/estonia.json format=topojson &&
mkdir csv && 
mapshaper -i *.shp -o csv format=csv
```

Note! The use of administrative and settlement units data is not restricted but the reference to the data source (i.e. Estonian Land Board) and validity date (e.g. 26.01.2012) must be made!

Source: [https://github.com/buildig/EHAK](https://github.com/buildig/EHAK)
