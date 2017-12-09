# manager
Application - the administrator panel for managing entities - dictionaries and users.

Application: the administrator's personal area.
Functionality: creation and editing of application entities.

Running:

* Clone app: `git clone git@github.com:mkdevprogects/base.git`
* `cd base/`
* Set the environment variables:
```
  PGUSER  
  PGPASSWORD  
  ENVPOSTGRES_DB  
  VOLUMES  
  ENVPGDATA  
  DB_HOST  
  DB_PG_PORT  
  DB_REDIS_HOST  
  DB_REDIS_PORT  
  HUTCH_MQ_HOST  
  HUTCH_MQ_API_HOST
```  
* `docker-compose -f docker-compose.demo.yml up`
* open browser and go to [http://0.0.0.0:3000/](http://0.0.0.0:3000/) and see patient app
* open browser and go to [http://0.0.0.0:4000/](http://0.0.0.0:4000/) and see manager app
* open browser and go to [http://0.0.0.0:5000/](http://0.0.0.0:5000/) and see history app

or

1. Set the environment variables for all apps:
```
PGUSER
DB_HOST
PGPASSWORD
ENVPOSTGRES_DB
ENVPGDATA
```
2. Clone app: `git clone git@github.com:mkdevprogects/base.git`
3. `cd base/`
4. `docker-compose up -d`
5. `cd ..`
6. Clone app: `git clone git@github.com:mkdevprogects/migrations.git`
7. `cd migrations/`
8. Create database: `rake db:create`
9. Run migrations database: `rake db:migrate`
10. `cd ..`
11. Clone app: `git clone git@github.com:mkdevprogects/manager.git`
12. `cd manager/`
13. Run app: `rails s -p 4000`
14. open browser and go to [http://localhost:4000/](http://localhost:4000/) and see manager app

Example environment variables:
```
PGUSER=postgres
PGPASSWORD=12345
ENVPOSTGRES_DB=mkdev_dev
VOLUMES=/Users/user_name/pg_data
ENVPGDATA=/Users/user_name/pg_data
DB_HOST=postgres
```
for running only this app use `DB_HOST=localhost`
```
DB_PG_PORT=5432
Set this environment variables if you run all apps:
DB_REDIS_HOST=redis
DB_REDIS_PORT=6379
HUTCH_MQ_HOST=rabbitmq
HUTCH_MQ_API_HOST=rabbitmq
```
