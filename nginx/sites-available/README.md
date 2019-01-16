These are the copies of the files from our remote Ubuntu machine.

These files may be located at `/etc/nginx/sites-available/` in order to configure the project.

These files do not contain sections which are managed by Certbot.
Check out this tutorial to set it up on a remote machine:
https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04

In order to enable gzip encoding you should additionally modify `/etc/nginx/nginx.conf` file:
to uncomment all gzip-related lines, to add `gzip_min_length 256;` line
and to add `application/vnd.ms-fontobject application/x-font-ttf font/opentype image/svg+xml image/x-icon`
to gzip_types line.
