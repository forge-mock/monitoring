BACKUP_DIR="/backups/prometheus"
VOLUME_NAME="monitoring_prometheus_data"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/prometheus_data_backup_${TIMESTAMP}.tar.gz"

sudo mkdir -p "$BACKUP_DIR"

VOLUME_PATH=$(sudo docker volume inspect --format '{{.Mountpoint}}' $VOLUME_NAME)

if [ -z "$VOLUME_PATH" ]; then
  echo "Error: Volume '$VOLUME_NAME' does not exist."
  exit 1
fi

echo "Backing up Prometheus data from volume '$VOLUME_NAME'..."
sudo tar -czf "$BACKUP_FILE" -C "$VOLUME_PATH" .

if [ $? -eq 0 ]; then
  echo "Backup successfully created: $BACKUP_FILE"
else
  echo "Error creating backup."
  exit 1
fi