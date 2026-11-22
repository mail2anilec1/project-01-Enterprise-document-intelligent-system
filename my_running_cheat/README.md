# Running this workspace

## 1. Prepare the Python environment

Run these commands from the repository root. This creates an `env` virtual
environment (ignored by Git), activates it, and installs the dependencies with
`uv`:

```bash
cd /workspaces/project-01-Enterprise-document-intelligent-system
uv venv --python 3.12 env
source env/bin/activate
uv pip install -r requirements.txt
```

## 2. Configure API credentials

The application loads environment variables from the repository-root `.env`
file. That file already exists in this workspace and is git-ignored. Edit it
without replacing existing values, and never commit or share its contents.

For the default providers, ensure `.env` contains:

| Variable | Purpose |
| --- | --- |
| `GROQ_API_KEY` | Required for the default Groq chat model |
| `HF_TOKEN` or `HUGGINGFACEHUB_API_TOKEN` | Required for the default Hugging Face embeddings |

You can instead use Google for chat and/or embeddings by setting
`LLM_PROVIDER=google` and/or `EMBEDDING_PROVIDER=google`. In either case,
`GOOGLE_API_KEY` is required. If embeddings remain set to `huggingface`, a
Hugging Face token is still required.

The development defaults use `APP_ENV=development` and `AUTH_MODE=sqlite`;
no JWT secret is needed for this local setup.

## 3. Start the app

From the repository root, with the virtual environment active:

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8080 --reload
```

Open the app at <http://127.0.0.1:8080/>. Create an account at
<http://127.0.0.1:8080/signup> to use the workspace. Account passwords must
be 15–128 characters.

Useful URLs:

- Health check: <http://127.0.0.1:8080/api/health>
- Interactive API docs: <http://127.0.0.1:8080/docs>

Stop the server with `Ctrl+C`.

## Troubleshooting

- **Missing-key error on startup:** check that the required provider key is
  set in `.env`, and that the provider selection matches that key.
- **Module not found:** activate the project virtual environment and run
  `uv pip install -r requirements.txt`.
- **Port 8080 is busy:** stop the other process or run Uvicorn on another
  port, for example `--port 8081`.
