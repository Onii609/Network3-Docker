FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    iproute2 \
    net-tools \
    iptables \
    wireguard \
    && apt-get clean

# Install Node.js (LTS version)
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Set the working directory
WORKDIR /root/ubuntu-node

# Copy the required files and folders
COPY manager.sh ./manager.sh
COPY wg0.conf ./wg0.conf
COPY arm64 ./arm64
COPY www ./www
COPY x86_64 ./x86_64
COPY entrypoint.sh ./entrypoint.sh

# Make the script executable
RUN chmod +x ./manager.sh

# Set entrypoint to run the permissions script before starting the main process
ENTRYPOINT ["/root/ubuntu-node/entrypoint.sh"]

# Set the default command
CMD ["bash", "-c", "./manager.sh up && tail -f /dev/null"]
