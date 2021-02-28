# README

This project uses React for the frontend and Ruby on Rails for the backend in the interest of time, as I'm most familiar with those tools at the moment.

## Setup
I recommend using [rvm](https://rvm.io/) to manage the ruby versions on your local device and [nvm](https://github.com/nvm-sh/nvm) to manage node versions. Once you've downloaded those tools, please run `rvm use` and `nvm use` from the project root to switch to the correct ruby and node versions for this project. If you dont have the versions specified in the .nvmrc and .ruby-version files, the prompts will tell you how to get them.

After you're done with the above, please run `bundle install` or just `bundle` to download the ruby dependencies for the project, and `yarn install` or just `yarn` to install the JS dependencies. Also run `bundle exec rake db:setup` to get the database created and seeded with test data. You may have to enter your local root user's password in the `config/database.yml` file if your user's password is different as the app may fail to connect to it.

## Running the app
To run the rails app, run `bundle exec rails s` and to run the webpack dev server that serves the react app, please run `./bin/webpack-dev-server` from the project root. Then navigate to `http://localhost:3000` on your browser and enjoy the app.

Note: This is a bare bones implementation and not designed with deployment in mind at the moment.