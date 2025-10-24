# Use Python 3.6 or later as a base image
FROM python:3.8

# Set working directory
WORKDIR /app

# Copy contents into image
COPY . /app

# Install pip dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set YOUR_NAME environment variable
ENV YOUR_NAME="Student"

# Expose the correct port (adjust if your app uses a different one)
EXPOSE 5500

# Create an entrypoint
ENTRYPOINT ["python", "app.py"]
