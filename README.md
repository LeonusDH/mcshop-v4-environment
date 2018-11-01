Готовая конфигурация окружения для McShop v4
============================================

Последовательность команд для разворачивания web-проекта:
```bash
git clone https://github.com/mops1k/mcshop-v4-environment.git application
cd application/
cp .env.dist .env
```
Отредактировать `.env` указав в **APPLICATION_ENV**=_dev_ или _prod_
```bash
docker-compose up -d git
docker-compose up -d nginx
```
Далее следовать инструкции из https://github.com/mops1k/mcshop-v4.git кроме шага клонирования проекта. Сам проект уже должен находиться в папке project, которая автоматически создалась при выполнении первых команд.

Для выполнения команд из инструкции выполнять:
```cmd
.\command.cmd команда
```
