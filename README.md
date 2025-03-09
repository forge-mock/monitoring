## Pre-Installation process

Install needed tools:

1. Docker from [Docker Official Page](https://docs.docker.com/engine/install/). Any version above 27.4.0 will do.

## Installation process

1. Clone the repository to VM that should monitor the processes.
2. Create prometheus.yml file:

```bash
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "mini-pc-node"
    static_configs:
      - targets: ["node-exporter:9100"]

  - job_name: "prometheus"
    static_configs:
      - targets: ["prometheus:9090"]

  - job_name: "cadvisor"
    static_configs:
      - targets: ["cadvisor:8080"]

  - job_name: "nginx-exporter"
    static_configs:
      - targets: ["nginx-exporter:9113"]

# Add other targets from VMs
```

3. Navigate to folder's root and run:

```bash
docker compose up
```

## Run the project

Navigate to http://localhost:80 and login into the Grafana

## Important notes

1. _prometheus.yml_ file should contain all VMs that are used in staging and production, scrape Node Exporter and cadvisor metrics from ports.
2. Configure regular backups for data using scripts in _backup-scripts_ folder.
