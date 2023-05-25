## Railway Remote + Local Dev

- Build infra services on Railway's nice UI (redis, connect git repo, etc
- Set env vars on remote
- Creating different environments clones those services across environments
- Run `railway run <cmd>` (ex `railway run yarn start`) and it runs local app, but uses env vars from remote
- Dynamically run on the `PORT` env var
