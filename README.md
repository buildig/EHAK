# EHAK

Eesti haldus- ja asustusjaotuse klassifikaatori ruumiandmed CSV, [GeoJSON](http://geojson.org/) ja [TopoJSON](https://github.com/topojson/topojson) formaadis / Spatial data for Estonian Administrative and Settlement Classification in CSV, [GeoJSON](http://geojson.org/) and [TopoJSON](https://github.com/topojson/topojson) format. [Monthly releases](https://github.com/buildig/EHAK/releases).

Preview: https://buildig.com/EHAK/

## [asustusyksus.json](https://github.com/buildig/EHAK/blob/master/topojson/asustusyksus.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/asustusyksus.json"></script>

## [omavalitsus.json](https://github.com/buildig/EHAK/blob/master/topojson/omavalitsus.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/omavalitsus.json"></script>

## [maakond.json](https://github.com/buildig/EHAK/blob/master/topojson/maakond.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/maakond.json"></script>

## [estonia.json](https://github.com/buildig/EHAK/blob/master/topojson/estonia.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/estonia.json"></script>

## Workflow

- Download shapefiles from [Maa-amet](http://geoportaal.maaamet.ee/eng/Maps-and-Data/Administrative-and-Settlement-Division-p312.html) and extract:
```
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/maakond_shp.zip" && 
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/omavalitsus_shp.zip" && 
curl -O "http://geoportaal.maaamet.ee/docs/haldus_asustus/asustusyksus_shp.zip" && 
unzip '*.zip'
```

- `mkdir geojson && mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o geojson format=geojson`
- `mkdir topojson && mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o topojson format=topojson`
- `mapshaper -i maakond_{date}.shp -dissolve -proj wgs84 -simplify dp 5% -o geojson/estonia.json`
- `mapshaper -i maakond_{date}.shp -dissolve -proj wgs84 -simplify dp 5% -o topojson/estonia.json format=topojson`
- `mkdir csv && mapshaper -i *.shp -o csv format=csv`
- remove dates from generated filenames

Note! The use of administrative and settlement units data is not restricted but the reference to the data source (i.e. Estonian Land Board) and validity date (e.g. 26.01.2012) must be made!

Source: [https://github.com/buildig/EHAK](https://github.com/buildig/EHAK)
