# EHAK

Eesti haldus- ja asustusjaotuse klassifikaatori ruumiandmed CSV, [GeoJSON](http://geojson.org/) ja [TopoJSON](https://github.com/topojson/topojson) formaadis / Spatial data for Estonian Administrative and Settlement Classification in CSV, [GeoJSON](http://geojson.org/) and [TopoJSON](https://github.com/topojson/topojson) format. [Monthly releases](https://github.com/buildig/EHAK/releases).

Preview: https://buildig.com/EHAK

## Workflow

Download shapefiles from [Maa-amet](http://geoportaal.maaamet.ee/eng/Maps-and-Data/Administrative-and-Settlement-Division-p312.html) and transform to json and csv format:
```
php -r "readfile('https://raw.githubusercontent.com/buildig/EHAK/master/workflow.sh');" > workflow.sh
chmod a+x workflow.sh
./workflow.sh
```
Note! The use of administrative and settlement units data is not restricted but the reference to the data source (i.e. Estonian Land Board) and validity date (e.g. 26.01.2012) must be made!

Source: [https://github.com/buildig/EHAK](https://github.com/buildig/EHAK)
