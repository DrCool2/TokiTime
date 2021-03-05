# README

# How to install TokiTime on a Mac - Development Version
## Date Created: 3-4-2021
## Creator: Scott Weinman
## Purpose: Instructions for Initial Setup and First Run of Application in Development Environment on a Mac

## Install Docker Desktop
### Source: https://www.docker.com/products/docker-desktop
 
## Install SQLSERVER in a Local Docker
### Source: https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&preserve-view=true&pivots=cs1-bash
sudo docker run -e "ACCEPT_EULA=Y" -e 'SA_PASSWORD=<YourStrongP@sswordHERE9>' -p 1433:1433 --name TokiTime -d mcr.microsoft.com/mssql/server:2019-latest

## download the TokiTime Ruby on Rails code
git clone https://github.com/DrCool2/TokiTime.git
cd TokiTime

## if needed, install the requested version of Ruby, typically the activerecord-sqlserver-adapter folks take time to ensure that their adapter works with the latest version of Ruby and Rails https://github.com/rails-sqlserver/activerecord-sqlserver-adapter
## sometimes this means the version of Ruby or Rails will be 6 to 8 months behind the latest available version when compared to Oracle or PostgreSQL
## I am very grateful to the activerecord-sqlserver-adapter community for supporting their project
## current version of Ruby and Rails supported by active record-sqlserver-adapter
### ruby 2.7.2
### rails 6.0.3.4
rvm install 2.7.2
rvm use 2.7.2

## install required software to connect Rails to SQL Server 
brew install freetds
bundle update

## update Yarn files if needed
yarn install —check-files

## update Ruby gems for good measure
bundle update

## setup your SQL Server username and password
## user: SA
## password: <YourStrongP@sswordHERE9>
rm -r config/master.key
rm -r config/credentials.yml.enc
export EDITOR=vim
rails db:credentials
development:
  username: SA
  password: <YourStrongP@sswordHERE9>
  host: localhost

## create the database and run migrations
rails db:create
rails db:migrate

## run the development version of application
rails s -p 4000 -b 0.0.0.0

## open browser of choice to confirm that everything is working
http://localhost:4000/tokis

# Troubleshooting Checklist
## Always make sure that your SQL Server Docker instance is running and functioning. You can test connectivity by using a great tool like DBeaver
### Source: https://dbeaver.io/download/

