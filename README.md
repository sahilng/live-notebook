# live-notebook
## A self-updating jupyter notebook -> HTML webserver

```sh
docker build -t live-notebook:latest .
```


```sh
docker run -p 8080:8080 -v ./live.ipynb:/app/live.ipynb -d live-notebook
```

By default, updates the notebook every minute and runs on port 8080.