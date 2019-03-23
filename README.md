# reloadingdb

[![Build Status](https://travis-ci.org/treydock/reloadingdb.svg?branch=master)](https://travis-ci.org/treydock/reloadingdb)
[![Coverage Status](https://coveralls.io/repos/github/treydock/reloadingdb/badge.svg?branch=master)](https://coveralls.io/github/treydock/reloadingdb?branch=master)


# Deploy

## Setup

```
cap staging puma:config
cap production puma:config
```

## Staging

```
cap staging deploy
```

## Production

```
cap production deploy
```

## Vagrant deploy testing

```
vagrant up --provision
DEPLOY_HOST=localhost DEPLOY_PORT=60022 cap staging deploy
DEPLOY_HOST=localhost DEPLOY_PORT=60022 cap production deploy
```