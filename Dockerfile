# Use the official Python image with version 3.8
FROM python:3.8

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter and nbconvert
RUN pip install --no-cache-dir jupyter nbconvert

# Copy the Jupyter notebook and template into the container
COPY live.ipynb /app/live.ipynb
COPY web-template /app/web-template

# Copy the run script and make it executable
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# Expose port 8080 for the web server
EXPOSE 8080

# Run the script
CMD ["./run.sh"]