# EHAK

Eesti haldus- ja asustusjaotuse klassifikaatori ruumiandmed [GeoJSON](http://geojson.org/) ja [TopoJSON](https://github.com/topojson/topojson) formaadis / Spatial data for Estonian Administrative and Settlement Classification in [GeoJSON](http://geojson.org/) and [TopoJSON](https://github.com/topojson/topojson) format.

Source: [https://github.com/buildig/EHAK](https://github.com/buildig/EHAK)

## [asustusyksus.json](https://github.com/buildig/EHAK/blob/master/topojson/asustusyksus.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/asustusyksus.json"></script>

## [omavalitsus.json](https://github.com/buildig/EHAK/blob/master/topojson/omavalitsus.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/omavalitsus.json"></script>

## [maakond.json](https://github.com/buildig/EHAK/blob/master/topojson/maakond.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/maakond.json"></script>

## [estonia.json](https://github.com/buildig/EHAK/blob/master/topojson/estonia.json)

<script src="https://embed.github.com/view/geojson/buildig/EHAK/master/topojson/estonia.json"></script>

## Workflow

1. Download shapefiles from [Maa-amet](http://geoportaal.maaamet.ee/eng/Maps-and-Data/Administrative-and-Settlement-Division-p312.html)
2. `unzip '*.zip'`
3. `mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o EHAK/geojson/ format=geojson`
4. `mapshaper -i *.shp -proj wgs84 -simplify dp 5% -o EHAK/topojson/ format=topojson`
5. `mapshaper -i maakond_20170101.shp -dissolve -proj wgs84 -simplify dp 5% -o EHAK/geojson/estonia.json`
6. `mapshaper -i maakond_20170101.shp -dissolve -proj wgs84 -simplify dp 5% -o EHAK/topojson/estonia.json format=topojson`

Note! The use of administrative and settlement units data is not restricted but the reference to the data source (i.e. Estonian Land Board) and validity date (e.g. 26.01.2012) must be made!
