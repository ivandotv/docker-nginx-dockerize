# NGINX with Dockerize

This is a default Nginx image built from the latest Nginx upstream, with [dockerize utility](https://github.com/jwilder/dockerize).

Only the [templating functionality](https://github.com/jwilder/dockerize#using-templates) of the dockerize utility is used.

## What it Does

Plese note that the **default Nginx configuration setup is unchanged**

Configuration files are just modified to support templating, so you can modify the values via environment variables.
Two configuration files can be changed with environment variables.
Take a look at those files to see what variables are supported.

- [`nginx.conf`](build-assets/nginx.conf)
- [`default.conf`](build-asses/default.con)

## Custom configuration directory

You can also mount a custom configuration directory, and all configuration files inside the directory will be run through the [dockerize template utility](https://github.com/jwilder/dockerize#using-templates) and `included` at the end of the [`nginx.conf`](build-assets/nginx.conf#L33) file.

`docker run host_template_dir:/etc/nginx/custom.tmpl.d ivandotv/nginx-dockerize`

From inside the container after processing the files in `/etc/Nginx/custom.tmpl.d` they are moved to the `/etc/nginx/custom.d` and loaded.

## Building the Image

Run `build.sh` script to build the image.
