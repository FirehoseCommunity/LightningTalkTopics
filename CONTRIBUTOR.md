# Welcome to the Firehose Lightning Talks topics app
## To contribute please follow the process detailed below.

In order for you to contribute you will need to do a few things first. Here are just some of the things you will need to do.

Fork the repository

Clone the repository
`git clone [your forked repo url]`

Setup the database
From your terminal make sure that you your are in your forked repositories directory.
Then you will want to copy the example database yml file to the proper location. The database is configured by default to use `postgres` and `password` as the username and password. You will want to change these accordingly to your environment.

`cp config/database.example.yml config/database.yml`

Build and Migrate the database
* `rake db:create:all`
* `rake db:migrate`

Install the gems
`bundle install`

Change the default_url_options (config/development) to 3030 for Vagrant only.
