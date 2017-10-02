# EHAK

Eesti haldus- ja asustusjaotuse klassifikaatori ruumiandmed CSV, [GeoJSON](http://geojson.org/) ja [TopoJSON](https://github.com/topojson/topojson) formaadis / Spatial data for Estonian Administrative and Settlement Classification in CSV, [GeoJSON](http://geojson.org/) and [TopoJSON](https://github.com/topojson/topojson) format. [Monthly releases](https://github.com/buildig/EHAK/releases).

Eelvaade / Preview: https://buildig.com/EHAK

## Veerud / Attributes

- MNIMI - maakonna nimi / County name
- MKOOD - maakonna kood / County ID
- ONIMI - omavalitsuse nimi / Municipality name 
- OKOOD - omavalitsuse kood / Municipality ID
- ANIMI - asustusüksuse nimi / Settlements name
- AKOOD - asustusüksuse kood / Settlement ID
- TYYP - [asustusüksuse tüüp / Settlement type](/csv/asustusyksus_tyyp.csv)
- AREA - pindala , m2 / area in square meters, [added](https://github.com/buildig/EHAK/issues/33) by _buildig_ with `mapshaper -each 'AREA=this.originalArea'`

## Workflow

Download shapefiles from [Maa-amet](http://geoportaal.maaamet.ee/eng/Maps-and-Data/Administrative-and-Settlement-Division-p312.html) and transform to json and csv format (requires [mapshaper](https://www.npmjs.com/package/mapshaper/tutorial)):
```
git clone git@github.com:buildig/EHAK.git &&
cd EHAK &&
chmod a+x workflow.sh &&
./workflow.sh &&
git push origin master
```
Note! The use of administrative and settlement units data is not restricted but the reference to the data source (i.e. Estonian Land Board) and validity date (e.g. 26.01.2012) must be made!

Source: [https://github.com/buildig/EHAK](https://github.com/buildig/EHAK)
