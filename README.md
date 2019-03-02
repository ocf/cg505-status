# OCF Status Page

This status page is currently available at http://dev-status.ocf.io.

## Cloning

This project uses submodules. To clone it, do

```sh
git clone --recursive git@github.com:ocf/status
```

If you've already cloned the repo but you still need the submodules, do

```sh
git submodule update --init
```

## Running

To run a dev version and make sure your changes look good:

```sh
make dev
```

Normally, Jenkins will build and deploy your changes once you push to
master. However, if Jenkins is down, you can do it manually:

```sh
make deploy
```

## Updating issues

Create a new file in `content/issues/` following the structure. It
will get picked up by hugo automatically.
