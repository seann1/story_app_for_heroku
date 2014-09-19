Story App for [Conventional rails assessment](http://www.learnhowtoprogram.com/lessons/conventional-rails-assessment) for [Epicodus](http://www.epicodus.com/).

This application is basically a blog. It lets users sign in, write stories and comment on stories.

The app is on [Heroku](http://story-app-assesment.herokuapp.com/).

##Setup
In your terminal, clone this repo:

```console
$ clone https://github.com/seann1/story_app.git
```

Install [postgres](http://www.postgresql.org/download/) and start the server:

```console
$ postgres
```
Install all dependencies:

```console
$ bundle install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:migrate
```

Finally, start the rails server:

```console
$ rails s
```

The app should now be available at 'localhost:3000'

license MIT

By Sean Niesen
