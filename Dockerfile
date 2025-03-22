# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

RUN apt-get update && \
    apt-get install -y nmap && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements.txt file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI app
COPY . /app/

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Command to run the FastAPI app with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
