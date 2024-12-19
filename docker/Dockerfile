# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set a working directory in the container
WORKDIR /app

# Copy the Python script into the container
COPY exporter.py .

# Install the required Python package
RUN pip install prometheus_client

# Expose the port used by the Prometheus exporter
EXPOSE 8000

# Set the default command to run the script
CMD ["python", "exporter.py"]
