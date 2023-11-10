## About

This library is a fork of https://github.com/openmaptiles/planetiler-openmaptiles.  
It converts OSM raw data to Mapbox's vector tiles.

## Set up dev environment

Follow this document: https://github.com/onthegomap/planetiler/blob/main/CONTRIBUTING.md

1. Install JDK and IntelliJ IDEA. During JDK installation, if it uses Windows MSI installer, make sure JAVA_HOME is set.
2. You can check JAVA_HOME on Windows powershell:

   ```
   $env:JAVA_HOME
   ```
3. In IntelliJ IDEA, make sure follow above document's `IDE SETUP` section.
4. In terminal (Windows powershell), run `./mvnw.cmd clean test` and see if all tests passed.

## Build

This project uses **Maven**. Run this to build.

```
.\mvnw.cmd clean package
```

It will produce two jar files:

```
.\target\planetiler-openmaptiles-3.14.0.jar
.\target\planetiler-openmaptiles-3.14.0-with-deps.jar
```

## Usage

1. Make sure copy necessary resources to **.\data** folder. Otherwise, need to download using --download flag.

Correct **.\data** folder resources:

```
.\data
├── sources
│   ├── lake_centerline.shp.zip
│   ├── natural_earth_vector.sqlite.zip
│   ├── singapore.osm.pbf
│   └── water-polygons-split-3857.zip
```

**Note:** `singapore.osm.pbf` is downloaded from https://download.bbbike.org/osm/bbbike/Singapore/
While `lake_centerline.shp.zip`, `natural_earth_vector.sqlite.zip` and `water-polygons-split-3857.zip` were downloaded
by using **--download** flag (may need to copy download url manually to browser for faster download).

2. Run the below command to generate singapore mbtiles:

```
java -Xmx8g -jar .\target\planetiler-openmaptiles-3.14.0-with-deps.jar --force --area=singapore
```

