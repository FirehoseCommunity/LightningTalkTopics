## Welcome to the Firehose Lightning Talks App
### To contribute please follow the process detailed below.
#### **Please listen to [this](https://devchat.tv/ruby-rogues/216-rr-code-review-culture-with-derek-prior) podcast episode before contributing!**
We want a condusive, welcoming, accepting, and positive community and the podcast covers great information on how to be a positive and welcoming contributor. It's worth the listn, I promise.

## Getting Started
##### Fork the repository
[Reference link on how to fork a repo and clone.](http://community.thefirehoseproject.com/2015/08/19/How-To-Fork-A-Repo-And-Contribute.html)

##### Clone the repository
`git clone [your forked repo url]`

##### Install the gems
`bundle install`

##### Preparing the database
`cp config/database.example.yml config/database.yml`

The database is configured by default to use `postgres` and `password` as the username and password. You will want to change these accordingly to your environment.

##### Build and Migrate the database
* `rake db:create`
* `rake db:schema:load`

##### **Vagrant Only** Change the `default_url_options` to port 3030
* Navigate to `config/environments/development.rb`
* Change `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }` to `config.action_mailer.default_url_options = { host: 'localhost', port: 3030 }`
