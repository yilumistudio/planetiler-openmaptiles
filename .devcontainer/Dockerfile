# Use an official OpenJDK runtime as a parent image
FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /workspace

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /workspace
COPY . /workspace

# Make port 8080 available to the world outside this container
EXPOSE 8080
