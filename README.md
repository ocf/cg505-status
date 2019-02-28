# OCF Status Page

This status page is currently available at http://dev-status.ocf.io.

## Running

To run a dev version and make sure your changes look good:

```sh
make dev
```

To deploy your changes (this should happen *before* (!) you commit
your changes):

```sh
make deploy
```

## Updating issues

Create a new file in `content/issues/` following the structure. It
will get picked up by hugo automatically.
