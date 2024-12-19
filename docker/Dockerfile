# Use Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the Python script to the container
COPY exporter.py .

# Install required Python packages
RUN pip install prometheus_client

# Set the command to run the Python script
CMD ["python", "exporter.py"]
