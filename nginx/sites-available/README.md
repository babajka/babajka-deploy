These are the copies of the files from our remote Ubuntu machine.

These files may be located at `/etc/nginx/sites-available/` in order to configure the project.

These files also contain sections which are managed by Certbot.
I guess they may be overwritten on setup.
Check out this tutorial to set it up on a remote machine:
https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04

In order to enable gzip encoding you should additionally modify `/etc/nginx/nginx.conf` file.

## Hints

### enable HSTS

into `/etc/nginx/nginx.conf` in the bottom of `https { }` section add:

```add_header Strict-Transport-Security "max-age=15768000; includeSubDomains" always;```
