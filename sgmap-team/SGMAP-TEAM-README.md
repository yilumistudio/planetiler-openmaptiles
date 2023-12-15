## About

This library is a fork of https://github.com/openmaptiles/planetiler-openmaptiles.  
It converts OSM raw data to Mapbox's vector tiles.  
Note that this library depends on https://github.com/onthegomap/planetiler

## Set up dev environment

#### Windows

Follow this document: https://github.com/onthegomap/planetiler/blob/main/CONTRIBUTING.md

1. Install JDK and IntelliJ IDEA. During JDK installation, if it uses Windows MSI installer, make sure JAVA_HOME is set.
2. You can check JAVA_HOME on Windows powershell:

   ```
   $env:JAVA_HOME
   ```
3. In IntelliJ IDEA, make sure follow above document's `IDE SETUP` section.
4. In terminal (Windows powershell), run `./mvnw.cmd clean test` and see if all tests passed.

#### Dev container

Some scripts in [scripts](../scripts) folder require bash and to be best run in linux.  
You can use VS code to open this repo in dev container (require docker). All environments are created correctly.

### Maven

This java project uses Maven. Please refer to [MAVEN-TIPS.md](MAVEN-TIPS.md) for tips.

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
   # 8g is the max memory allowed for java
   java -Xmx8g -jar .\target\planetiler-openmaptiles-3.14.0-with-deps.jar --force --area=singapore
   ```

## Customization

#### Add custom layers

See examples in [addons](../src/main/java/org/openmaptiles/addons) directory.

#### Customize result from [Generate.java](../src/main/java/org/openmaptiles/Generate.java)

Need to run in linux. Preferably from wsl with jdk 21 installed.

```
# official openmaptiles repo. Not using this if need to customize scheme.
./scripts/regenerate-openmaptiles.sh v3.14 https://raw.githubusercontent.com/openmaptiles/openmaptiles/
```

```
# In yilumistudio/planetiler-openmaptiles repo, run this to generate if locally hosted. 
# Note that this require Generate.java to be modified to recognize the key word "local".
./scripts/regenerate-openmaptiles.sh local http://localhost:23222/

# Otherwise, once released on github, run this to generate.
./scripts/regenerate-openmaptiles.sh version https://raw.githubusercontent.com/yilumistudio/openmaptiles/
```

