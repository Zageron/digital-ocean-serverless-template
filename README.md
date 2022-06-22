# Pixel Dailies - Count via Twitter

## Setting up doctl

- Install doctl manually, or via choco. `choco install doctl`
- Authorize doctl. `doctl auth init --context customname`
- Switch to the new identity context. `doctl auth switch --context customname`
- Install the DigitalOcean sandbox: `doctl sls install`
- Connect to your sandbox: `doctl sandbox connect`

## Convert from Template to Function

- Modify `.do/deploy.template.yaml`
  - Edit `functions/github/repo` to your desired repo `user/repo`.
  - Edit `functions/name` to your desired function name.
  - Edit `name` to your desired do function name.

For more details see [App Specification Reference](https://docs.digitalocean.com/products/app-platform/references/app-specification-reference/) and [How To - Manage Functions](https://docs.digitalocean.com/products/app-platform/how-to/manage-functions/)

### Project.yml

- In order to have the unmodified body be passed to your function,
be sure to set the following in project.yml.

```yml
packages:
  - name: test-serverless
    actions:
      - name: test
        runtime: 'python:default'
        web: raw

```

## Testing - Deploy to DO Function

If you have dependencies in any of the actions,
you will need to implement `build.<sh|cmd>` scripts for your platform.

`doctl sls deploy . --incremental --env .env`

If you'd rather just implement different platform build scripts,
then use the following command to keep to one.

`doctl sls deploy . --remote-build --env .env`

### Watch

You may also use incremental directory watching to avoid having to run deployment automatically.

`doctl sls watch .`
