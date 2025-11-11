# Use official NGINX base image
FROM nginx:alpine

# Install bash (for scripting) and tzdata if needed
RUN apk add --no-cache bash tzdata

# Copy a simple script to log time
COPY log-time.sh /usr/local/bin/log-time.sh
RUN chmod +x /usr/local/bin/log-time.sh

# Expose NGINX port
EXPOSE 80

# Run NGINX and the logging script in the background
CMD ["/bin/sh", "-c", "/usr/local/bin/log-time.sh & nginx -g 'daemon off;'"]
