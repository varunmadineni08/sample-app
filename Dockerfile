# -------- Build Stage --------
FROM python:3.11 AS build

WORKDIR /app

# Copy project files
COPY . .


# -------- Runtime Stage --------
FROM python:3.11-slim

WORKDIR /app

# Copy application from build stage
COPY --from=build /app /app

CMD ["python3", "app.py"]


