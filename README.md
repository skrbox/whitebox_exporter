# whitebox_exporter

collect metrics from any http requests for prometheus

## Quick start

### from git repo

```shell
git clone https://github.com/skrbox/whitebox_exporter.git

cd whitebox_exporter

make binary

./whitebox_exporter --meta.config-file=conf.yaml
```

### from docker

```shell
docker run jeyrce/whitebox_exporter:latest -p 12306:12306 
```

### others

There's a repo [box](https://github.com/skrbox/box) contributed by any other developers may find configuration files you
needed.

## Contributing

- 1、fork the repo
- 2、edit in your repo
- 3、commit relate to an issue
- 4、make pull request

## License

Apache License 2.0, see [LICENSE](./LICENSE)

