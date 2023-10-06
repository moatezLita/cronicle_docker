#!/bin/bash

# This is the setup script for Cronicle
/opt/cronicle/bin/control.sh setup

# Additional commands or configurations, if needed
# ...
# chmod 777 /opt/cronicle/logs
# Start Cronicle (you can choose whether to start it immediately)
/opt/cronicle/bin/control.sh start

# Keep the container running
tail -f /dev/null

