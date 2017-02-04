Docker image with built on `Alpine linux` including `PHP 7.1`, `composer`, `PHPUnit 5.7 + xdebug` and `hirak/prestissimo` for faster composer downloads

### Usage

In your own Dockerfile

```dockerfile
FROM lsv20/phpunit-image
COPY . /app
WORKDIR /app
RUN composer --no-scripts install && \
    vendor/bin/phpunit
```

Test your application directly from the commandline

```bash
docker build -t lsv20/phpunit-image .
```

###### Why not PHPUnit 6

The reason why this is not using PHPUnit 6 yet, is because as I use this for symfony 3 projects
