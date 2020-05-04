# Docker Deployment

This document describes how home-recipes server and telemetry infrastructure can be deployed to a local Docker instance.

There will be three containers deployed:
* **home-recipes-server** exposing ports: `5000` and `2112`
* **home-recipes-prometheus** exposing port: `9090`
* **home-recipes-grafana** exposing port: `3000`

## Preconditions

It's expected that the image **kaushikchaubal/home-recipes** for container  **home-recipes-server** already exists. Deployment script will use version `latest`.

## Steps

From project root build docker compose
```
docker-compose -f deploy/docker/local/docker-compose.yml build
```
From project root build docker compose
```
docker-compose -f deploy/docker/local/docker-compose.yml up
```

## Telemetry

As part of the telemetry infrastructure Grafana and Prometheus servers are being created. They are reachable at:
* Grafana: http://localhost:3000/
* Prometheus: http://localhost:9090/
* Home Recipes raw metrics endpoint: http://localhost:2112/metrics

Grafana dashboard can be accessed with default credentials: login (`admin`), password (`admin`). There are two pre-crafted dashboard available:
* **Prometheus 2.0 Stats** for metrics on Prometheus server
* **Home Recipes** for metrics on home-recipes-server