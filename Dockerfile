# Use the official Python image with version 3.11
FROM python:3.11

# Set the working directory
WORKDIR /app

# Install Jupyter and nbconvert
RUN pip install --no-cache-dir jupyter nbconvert

# Copy the files into the container
COPY . .

# Expose port 8080 for the web server
EXPOSE 8080

# Run the script
CMD ["./start.sh"]