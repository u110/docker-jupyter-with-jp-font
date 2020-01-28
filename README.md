# docker-jupyter-with-jp-font

## How to use

```
docker run --rm \
  -p 8888:8888 \
  -v /path/to/local/note/:/home/jovyan/work \
  u110/jupyter-with-jp-font
```

### without token

```
docker run --rm \
  -p 8888:8888 \
  -v /path/to/local/note/:/home/jovyan/work \
  u110/jupyter-with-jp-font \
    jupyter notebook \
      --ip=0.0.0.0 \
      --no-browser \
      --allow-root \
      --port=8888 \
      --NotebookApp.token=''
```
