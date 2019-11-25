Docker image for building Nomad UI static assets.

# Build the image

```
docker build -t schmichael/nomad-make-ui .
```

# Use the image

```
cd $GOPATH/src/github.com/hashicorp/nomad
docker run --rm -v $(pwd):/go/src/github.com/hashicorp/nomad schmichael/nomad-make-ui
go install -tags ui
```
