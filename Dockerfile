# Use an official Python image as the base image
FROM python:3.11-slim

# Set a non-root user and create a working directory
RUN useradd -m nonrootuser && mkdir -p /app && chown -R nonrootuser:nonrootuser /app

# Switch to the non-root user
USER nonrootuser

# Set the working directory
WORKDIR /app

# Copy application files into the working directory
COPY --chown=nonrootuser:nonrootuser . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set file system to be read-only at runtime
CMD ["sh", "-c", "mount -o remount,ro /"]

# Expose a port (adjust if your app listens on a different port)
EXPOSE 8000

# Run the Python application (replace 'app.py' with your app's entry point)
CMD ["python", "app.py"]
