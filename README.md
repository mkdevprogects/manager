# manager
Application - the administrator panel for managing entities - dictionaries and users.

Running:

* git clone git@github.com:mkdevprogects/base.git
* cd ~/base
* Set the environment variables:
  DB_HOST
  PGPASSWORD
  PGUSER
  ENVPOSTGRES_DB
  
* docker-compose -f docker-compose.demo.yml up
* open browser and go to http://0.0.0.0:3000/
* open browser and go to http://0.0.0.0:4000/

or

1. Clone app: git clone git@github.com:mkdevprogects/migrations.git
2. cd ~/migrations
3. Set the environment variables:
DB_HOST
PGPASSWORD
PGUSER
4. Create database (rake db:create)
5. rake db:migrate
6. git clone git@github.com:mkdevprogects/manager.git
7. cd ~/manager
8. rails s
9. open browser and go to http://localhost:4000/

Example environment variables:

DB_HOST=postgres

PGPASSWORD=12345

PGUSER=postgres

ENVPOSTGRES_DB=some_base