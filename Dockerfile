# Use an official Julia runtime as a parent image
FROM julia

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

RUN julia -e 'import Pkg; Pkg.pkg"add WebSockets WebIO Interact Widgets UnicodePlots CSV DataFrames"'

# Make port 80 available to the world outside this container
EXPOSE 8081

# Run main.jl when the container launches
CMD ["julia", "main.jl"]
