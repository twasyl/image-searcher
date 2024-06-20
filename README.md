This project aims to use an OCR engine to search for words in software screenshots. 

You can find pre-built Docker images on [Docker Hub](https://hub.docker.com/r/twasyl/image-searcher).

Source code can be found on [GitHub](https://github.com/twasyl/image-searcher).

# Building

You must have installed Docker on your system and must have cloned this repository.
In order to build the Docker image image:

1. Using a command line, go in the folder containing this repository
2. Execute `docker build -t twasyl/image-searcher:latest .`

# Using

We assume the folder containing screenshots, either directly or recursively, on your system is `/Users/me/project`.

## Default behaviour

Run the previously built image using the following command:

```
$ docker run --rm -it \
         -v /Users/me/project:/work \
         twasyl/image-searcher:latest
```

## Customize the offensive words

Words are stored in an environment variable named `SEARCHED_WORDS` (default value is `master slave blacklist whitelist`) and are space separated. If you want to override the list, run the following command:

```
$ docker run --rm -it \
         -v /Users/me/project:/work \
         -e SEARCHED_WORDS="word1 word2" \
         twasyl/image-searcher:latest
```