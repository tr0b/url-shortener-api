# Setup

Make sure you have the following pre-requisites before setting up the project:

* [Docker](https://www.docker.com/), along with [Docker-compose](https://github.com/docker/compose) (Included in Docker for both Windows and MacOS)
* [SQLite](https://www.sqlite.org/index.html) (Already included in MacOS)

We are using `Docker` in order to handle all dependencies in standard containers. Therefore this should work in any OS that supports Docker (Windows, Linux or MacOS).


First, clone the repository, checkout to the `main` branch `git checkout main` and build the containers.

```docker-compose build```

Then, create a `.env` file in the root directory, setting up the JOB WORK DIR redis variable

```echo "JOB_WORKER_URL=redis://redis:6379/0" >> .env```

Afterwards, run the containers in order to start the rails project

```docker-compose up```

Or, if you want to run them in background mode,

```docker-compose up -d```

Open a new tab in your browser, and head over to `http://localhost:3000` (mind the `http`, since we are not using SSL for this local project)

# API

You can query the API directly, through the `/url` [POST, GET, PUT, DELETE] routes. 
The [POST] route will take the url, create a `short_url` through the `Shortener` service, and insert this in the database

Now, every time we enter a valid short url (example: `http://localhost/0af`), we will be redirected to its original url

# TODO [WIP]

- [x] Add rspec tests (done)
- [x] Add `sidekiq` to project, along with `redis`, in order to perform web crawling, fetch title of page and store it on the database. (done)
- [ ] Add web crawler job and logic (pending)
- [ ] Add views (pending) 
- [ ] Add `faker` gem in order to bulk insert fake `url`s through rake task, for populating db purposes. (Nice to have)
