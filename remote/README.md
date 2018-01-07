Remote code structure:

```
/
  babajka-backend/
  babajka-deploy/
  babajka-frontend/
  babajka-root/
```

One might want to push all sensitive data to remote machine with `local` scripts first.

Consider running any of three following scripts:

* `run-from-scratch.sh` - clones repos and runs them.

* `update-all.sh` - pulls from GitHub, installs and runs.

* `quick-start.sh` - runs installed.

All scripts mentions above are SAFE and do environmental check before running.

Babajka is then available on `:3000` (default), backend is on `:8080`.
