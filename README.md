# live-notebook
## A self-updating jupyter notebook -> HTML webserver

- Create `.env` based on `.env.example`
- Add any necessary notebook dependencies to `requirements.txt`
- Build and run the container:
    ```sh
    ./run.sh
    ```

By default, updates the notebook every minute and runs on port 8080.