# Slingshot

Slingshot is a single threaded reverse proxy, meant to simplify the
development environment for engineers working on multiple microservices on
their local machine.

## How to run

Receive requests on port 5000 and forward them to port 3000:

```bash
# GET http://localhost:5000/users/123 -> http://localhost:3000/users/123
slingshot
```

Receive requests on port 8080 and forward them to port 3000:

```bash
# GET http://localhost:8080/users/123 -> http://localhost:3000/users/123
slingshot --port 8080
```

Receive requests on port 5000 and only accept those starting with `/users`,
which are forwarded to port 3000, while dropping the rest with a 404 error:

```bash
# GET http://localhost:5000/users/123 -> http://localhost:3000/users/123
slingshot --route "/users"
```

Receive requests on port 5000 and route all requests starting with `/users`, which are forwarded to port 3001, while dropping the rest with a 404 error:

```bash
# GET http://localhost:5000/users/123  -> http://localhost:3001/users/123
slingshot --route "/users=http://localhost:3001"
```

Receive requests on port 5000 and route all requests starting with `/users`,
which *have the path prefix stripped* (note the ending slashes for `/users/`
and `http://localhost:3001/v1/accounts/`) and are forwarded to port 3001,
while dropping the rest with a 404 error:

```bash
# GET http://localhost:5000/users/123 -> http://localhost:3000/v1/accounts/123
slingshot --route "/users/=http://localhost:3001/v1/accounts/"
```

Receive requests on port 5000 and route all requests starting with `/users`,
which *have the path prefix stripped* (note the ending slashes for `/users/`
and `http://localhost:3001/v1/accounts/`) and are forwarded to port 3001,
and route all requests starting with `/products` to port 3000, while dropping
the rest with a 404 error:

```bash
# GET http://localhost:5000/users/123 -> http://localhost:3000/v1/accounts/123
slingshot --route "/users/=http://localhost:3001/v1/accounts/" \
  --route "/auth"
```

Or you can configure Slingshot via a TOML file:

```bash
slingshot --config slingshot.toml
```

A sample configuration file:

```toml
[server]
port = 8080

[auth]
path = "/auth"
target = "http://localhost:3000"

[users]
path = "/users"
target = "http://localhost:3001"

[payments]
path = "/payments"
target = "http://localhost:4000/api"
strip_prefix = true
```
