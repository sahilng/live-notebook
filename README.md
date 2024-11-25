# live-notebook
## A self-updating jupyter notebook -> HTML webserver

### Running from image:

In a directory containing `requirements.txt` and a Jupyter notebook, for example `test.ipynb`:
```sh
export LIVE_NOTEBOOK=test.ipynb
docker pull sahilng/live-notebook
docker run -p 8080:8080 -e LIVE_NOTEBOOK=$LIVE_NOTEBOOK -v ./requirements.txt:/app/requirements.txt -v ./$LIVE_NOTEBOOK:/app/$LIVE_NOTEBOOK.ipynb -d sahilng/live-notebook
```

### Running from source:
- Create `.env` based on `.env.example`
- Add any necessary notebook dependencies to `requirements.txt`
- Start the service locally with: (kill the server using the PID from `lsof -i :8080` after exiting the script)
    ```sh
    ./start.sh
    ```
- Or build and run the container:
    ```sh
    ./run.sh
    ```

By default, updates the notebook every minute and runs on port 8080.
