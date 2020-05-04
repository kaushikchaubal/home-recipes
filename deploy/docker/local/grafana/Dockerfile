FROM grafana/grafana
ADD dashboards /var/lib/grafana/dashboards
ADD provisioning /etc/grafana/provisioning
ADD config.ini /etc/grafana/config.ini
ADD provisioning/dashboards /var/lib/grafana/dashboards

RUN grafana-cli --insecure plugins install grafana-piechart-panel