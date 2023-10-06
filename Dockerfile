# Use a base Node.js image suitable for your application
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Install any dependencies required for the Cronicle installation
# You may need to adjust this based on your specific requirements
RUN apt-get update && apt-get install -y \
    curl

# Run the installation command for Cronicle
RUN curl -s https://raw.githubusercontent.com/jhuckaby/Cronicle/master/bin/install.js | node

# Copy the setup script into the Docker image
COPY setup_cronicle.sh /app/

# Make the script executable
RUN chmod +x /app/setup_cronicle.sh
RUN chmod 777 /opt/cronicle/logs
EXPOSE 3012
# Specify the CMD to run the setup script when a container is started
CMD ["/app/setup_cronicle.sh"]
