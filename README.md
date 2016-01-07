# OYNC (Osm sYNC) Tilemill

[![Build Status](https://travis-ci.org/SEL-Columbia/oync-tilemill.svg?branch=master)](https://travis-ci.org/SEL-Columbia/oync-tilemill)

System for styling, and exposing Openstreetmap server data from a PostGIS database via [OYNC](https://github.com/SEL-Columbia/oync) and [Tilemill](https://github.com/mapbox/tilemill)

## Description

The system is comprised of 3 services, all exposed via docker:

- tilemill:  map styling and tile server
- oync:  sync data from an osm instance with postgis db
- db:  postgis database housing osm data 

## Setup

To run your own instance of oync-tilemill, do the following:

1.  Setup an openstreetmap-website instance.  
There are several docker images available for this on [docker hub](hub.docker.com).  
The SEL image is available [here](https://hub.docker.com/r/selcolumbia/osm-gridmaps-cgimap) with setup instructions [here](https://github.com/SEL-Columbia/osm-devops)

2.  Setup a server to deploy oync-tilemill and [install docker and docker compose](https://docs.docker.com/engine/installation/).

3.  Clone this repository on that machine.

4.  Edit docker-compose.yml to specify the `OYNC_OSM_API_URL` as the base url of the server you setup in step 1.

5.  Run the tilemill service via `docker-compose up tilemill` 

6.  Using the url of the server setup in step 2, navigate your browser to http://\<server-url>:20009 to manage tilemill

7.  Configure a project in tilemill and add layers from the postgis database.  The following files in this repository can be used as a guide:

	- connection_string.txt:  connects to the db which is synchronized with osm
    - style.mss:  default styling for points and lines
    - points.sql:  default sql to retrieve point data
    - lines.sql:  default sql to retrieve line data
   
    An "oync-default" project should be available for testing.

8.  Reference the tile server and project for your site via a map tile rendering client (e.g. [leaflet](http://leafletjs.com/) )  
    The tile server url will be of the form:  http://\<server-url>:20008/tile/\<tilemill-project-name>/{z}/{x}/{y}.png
