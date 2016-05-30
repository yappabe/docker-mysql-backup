![Docker pulls](https://img.shields.io/docker/pulls/yappabe/mysql-backup.svg?style=flat)

# Yappa Mysql Backup Image

## Usage

Add the following to your docker-compose.yml file:

```YAML
backup:
    image: yappabe/mysql-backup
    links:
        - mysql
    environment:
        DBS: db1
        MYSQL_USERNAME: mysqlusername
        MYSQL_PASSWORD: mysqlpassword
        MYSQL_HOST: mysql
        RSYNC_COMMAND: "rsync -avz -e \"ssh -p 2122 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null\" %DIR%/* user@host:/backup_path"
        CRON_TIME: "0 17 * * *"
```

### The container isn't authorized to access the remote server

You can generate/add or mount a private key:

```
volumes:
        - ~/.ssh/id_rsa:/root/.ssh/id_rsa
```

