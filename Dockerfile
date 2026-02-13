FROM python:3.11 AS build

# Set the working directory in the image
WORKDIR /app

# Copy the files from the host file system to the image file system
COPY . /app

FROM python:3.11

WORKDIR /app   

COPY --from=build /install/usr/local
COPY --from=build /app/app

CMD ["python3","app.py"]

