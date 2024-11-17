# live-notebook
## A self-updating jupyter notebook -> HTML webserver

- Create `live.ipynb` based on `example.ipynb`

- Build the image:
    ```sh
    docker build -t live-notebook .
    ```

- Run the container:
    ```sh
    docker run -p 8080:8080 -v ./live.ipynb:/app/live.ipynb -v ./web:/app/web -d live-notebook
    ```

By default, updates the notebook every minute and runs on port 8080.
