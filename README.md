# Noteworthy

[![Build Status](https://travis-ci.org/hellojustin/noteworthy.svg?branch=master)](https://travis-ci.org/hellojustin/noteworthy)
[![Maintainability](https://api.codeclimate.com/v1/badges/b65f56a6c8176757d677/maintainability)](https://codeclimate.com/github/hellojustin/noteworthy/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/b65f56a6c8176757d677/test_coverage)](https://codeclimate.com/github/hellojustin/noteworthy/test_coverage)

## Setting up your development environment

1.  Install system prerequisites:
    * **Ruby** - version 2.3.1 or later. This project contains `.ruby_version`
      file, so if you use [rbenv](https://github.com/rbenv/rbenv), you'll be
      automatically switched to 2.3.1.

    * **Bundler** - Ruby dependencies for this app are managed using the Bundler
      gem. After installing ruby, run `gem install bundler` to install Bundler.
      Once complete, the `bundle` command should be available on your path.

    * **Pow** - A ~~zero-~~ low-configuration rack server. This one's actually
      optional, but recommended for ease of development. Simply run
      ``` sh
      $ curl get.pow.cx | sh
      ```
    * **PostgreSQL** - An open-source relational database with great GIS plugins.
      For mac users who don't like headaches, we highly recommend the
      [Postgres App](http://postgresapp.com/). If you enjoy the occasional
      headache, postgres can be installed via
      [Homebrew](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/) or
      [MacPorts](https://github.com/codeforamerica/ohana-api/wiki/Installing-PostgreSQL-with-MacPorts-on-OS-X).
      If you're a connoisseur of headaches, you may [install postgres from source](https://www.postgresql.org/docs/9.1/static/installation.html).

    * **Heroku CLI** - Heroku's command-line interface.
      ```sh
      $ brew install heroku
      ```

1.  Clone this repository using git (we recommend using SSH for pulls/pushes):
    ``` sh
    $ git clone git@github.com:hellojustin/noteworthy.git
    ```

1.  Install dependencies via Bundler. We recommend using the `path` setting to
    place all the installed gems in a subdirectory of this project. That way,
    you'll avoid version conflicts with already-installed versions, and can
    blow away your bundle without breaking other projects.
    ``` sh
    $ bundle install --path .bundle
    ```

1.  Create a `.env` file to store your environment variables. The `.env` file will
    contain environment variables for your app (things like the Database Url,
    Stripe API Keys, and other settings/credentials). We've provided an example
    file which has all the right variable names. Just copy it and replace the
    values. We use the `.env` file so that you don't have to pollute your
    system environment with variables for this application. Unfortunately, this
    means running our app locally is a little more complicated (see next step).
    ``` sh
    $ cp .env.example .env
    ```

1.  Prepare your database:
    ``` sh
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed
    ```

1.  At this point you can serve the app locally via Puma using the following
    command:
    ``` sh
    $ bundle exec foreman run rails s
    ```
    This works and you can visit your app at http://localhost:3000, but the
    foreman and bundle exec calls are a little messy. Instead, we recommend
    using Pow. With Pow, there's just a little first-time setup, but after that
    you only need to interact with pow when you want to restart the app. To set
    up your app for Pow, simply create a symlink in your `~/.pow` directory, and
    restart the app. Like so:
    ``` sh
    $ ln -s $(pwd) ~/.pow/noteworthy
    $ mkdir tmp
    $ touch tmp/restart.txt
    ```
    Now you can visit your app at http://noteworthy.dev. Note that you
    don't have to worry about port numbers when running multiple rails apps, and
    your apps are served from a real-looking domain.

## Running the tests suite/build

Test suite coming soon.

## Deploying to production

1.  Configure a git remote to point at the production Heroku environment:
    ``` sh
    $ heroku git:remote -a noteworthy
    ```

1.  Push the master branch to the heroku remote:
    ``` sh
    $ git push heroku master
    ```

## Known technical debt

This will become a list of issues that we know we have to fix.
