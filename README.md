# EHAK

Eesti haldus- ja asustusjaotuse klassifikaatori ruumiandmed [GeoJSON](http://geojson.org/) formaadis / Spatial data for Estonian Administrative and Settlement Classification in [GeoJSON](http://geojson.org/) format.

- [Eesti haldus- ja asustusjaotus](http://geoportaal.maaamet.ee/est/Andmed-ja-kaardid/Haldus-ja-asustusjaotus-p119.html)
- [Estonian Administrative and Settlement Division](http://geoportaal.maaamet.ee/eng/Maps-and-Data/Administrative-and-Settlement-Division-p312.html)

## Workflow

1. Download files from Maa-amet
2. `unzip '*.zip'`
3. `mapshaper *.shp -proj wgs84 -o EHAK/ format=geojson`

