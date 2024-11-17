# Use the official Python image with version 3.11
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy the "web-template" directory into "/app/web-template" in the container
COPY web-template /app/web-template

# Copy the start script into the working directory
COPY start.sh /app/start.sh

# Make sure the start script is executable
RUN chmod +x /app/start.sh

# Expose port 8080 for the web server
EXPOSE 8080

# Run the start script
CMD ["./start.sh"]