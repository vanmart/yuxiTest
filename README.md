# README

* Ruby version 2.3.1

* System dependencies
  execute bundle install

* Database Postgres

* Configuration

  *need to run migrations

  rake db:migrate

  *need to seed

  rake db:seed

* currently running on
  https://parkingyuxitest.herokuapp.com/

*Roles and default accounts

  MasterAdmin: can manage all, acces to dashboard
  user:vanmartc@mail.com
  pass:1234321

  Admin: can manege a parking and acces to dashboard
  user:admin@mail.com
  pass:1234321

  ParkingAttendant: can not acces to dashboard - administration site
  user: attendant@mail.com
  pass: 1234321

  New Users
  RegularUser: can not acces to dashboard - administration site


#only
#if you are having problems with styles run this commands

rails generate bootstrap:install less
rails generate bootstrap:install static