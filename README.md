Готовая конфигурация окружения для McShop v4
============================================

Последовательность команд для разворачивания web-проекта:
```bash
git clone https://gitlab.com/jmd-team/mcshop-v4-environment.git application
cd application/
cp .env.dist .env
```
Отредактировать `.env` указав в **APPLICATION_ENV**=_dev_ или _prod_
```bash
docker-compose up -d git
docker-compose up -d nginx
```
Далее следовать инструкции из https://gitlab.com/jmd-team/mcshop-v4

Для выполнения команд из инструкции выполнять:
```cmd
.\command.cmd команда
```
