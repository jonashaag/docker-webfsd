A tiny Alpine Linux based image that contains the webfsd (http://linux.bytesex.org/misc/webfs.html) binary.

Default CMD is `webfsd -p 80 -d -r /srv`.

Example usage:

```
docker run -it -p80:80 -v /your/webroot:/srv jonashaag/webfsd
```
