## Pre-Installation process

Install needed tools:

1. Docker from [Docker Official Page](https://docs.docker.com/engine/install/). Any version above 27.4.0 will do.

## Installation process

1. Clone the repository to VM that should monitor the processes.
2. Navigate to folder's root and run:

```bash
docker compose up
```

## Run the project

1. Navigate to http://localhost:3000/ and login into the Grafana:

## Important notes

1. _prometheus.yml_ file should contain all VMs that are used in staging and production, scrape Node Exporter and cAdvisor metrics from ports.
2. Configure regular backups for data using scripts in _backup-scripts_ folder.
