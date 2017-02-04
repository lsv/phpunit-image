Docker image with built on `Alpine linux` including `PHP 7.1`, `composer`, `PHPUnit 5.7 + xdebug` and `hirak/prestissimo` for faster composer downloads

### Usage

In your own Dockerfile

```dockerfile
FROM lsv20/phpunit-image
COPY . /app
WORKDIR /app
RUN composer.phar --no-scripts install && \
    phpunit
```

Test your application directly from the commandline

```bash
docker build -t lsv20/phpunit-image .
```

### bins

* composer is in `/usr/local/bin/composer.phar`, can be called as `composer.phar`
* phpunit is installed as global, which are in `PATH`, can be called as `phpunit`

###### Why not PHPUnit 6

The reason why this is not using PHPUnit 6 yet, is because as I use this for symfony 3 projects
