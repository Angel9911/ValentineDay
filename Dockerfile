# Use PHP 8.2
FROM php:8.2-cli

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Railway provides PORT dynamically
ENV PORT=8080

# Expose port (Railway ignores this, но е добра практика)
EXPOSE 8080

# Start PHP built-in server
CMD ["sh", "-c", "php -S 0.0.0.0:${PORT} -t ."]