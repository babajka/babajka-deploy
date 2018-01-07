Remote code structure:

```
/
  babajka-backend/
  babajka-deploy/
  babajka-frontend/
  babajka-root/
```

A set of scripts running the project in one terminal. Might be useful both
in local usage and to run project remotely.

Some use cases:

* `bash run.sh` - clones from GitHub, installs master branches, starts.

* `bash run.sh path1 path2` - installs backend and frontend from paths and starts them.

* `bash install.sh path1 path2` - installs backend and frontend. Paths default to
  `tmp/babajka-backend` and `tmp/babajka-frontend` respectively.

* `bash go_live.sh path1 path2` - starts preinstalled backend and frontend.
  Defaults are the same as above.

* `bash update_github.sh path1 path2` - pulls code from GitHub, installs (if required),
  starts an updated version. Consider terminating the jobs before running the script
  with `pkill node` (for example).

Babajka is then available on `:3000`, backend is on `:8080`.
