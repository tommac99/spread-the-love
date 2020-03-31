# README

### How to get started
First Clone the repo

#### How can I fire up the app?
Good question! Make sure you have Ruby ([rvm](https://rvm.io/rvm/install)), [nvm](https://github.com/nvm-sh/nvm#installing-and-updating), [Yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable), [Redis](https://formulae.brew.sh/formula/redis), and [Postgres](https://postgresapp.com/) installed, then run:

`bundle install`
`yarn`
`bin/rails db:create db:migrate db:seed`

then to start the servers in one terminal tab run:

bin/rails s

and in the other tab run:
bin/webpack-dev-server

Navigate to [http://localhost:3000](http://localhost:3000).

### Before writing any code!
1. Check you're in the the right branch

#### How to go about work
2. Run `git fetch` and `git pull` to get the latest work
3. Create a new branch `git checkout -b feature/navbar`
##### Do some work
4. `git add .` or `ga .`
5. `git commit -am` or `gc -am "Add navbar component, Change global color, Removed temp-navbar"`
6. `git push` or `gp -u origin head`
## DO NOT PUSH TO MASTER! PLEASE.

#### On Github
7. Create PR (Pull Request) and use comment `Closes #25` to close the linked issue.  (25 represents the issue number)
8. Move the cards to Being Reviewed and Review lists on the project board
9. Assign someone to review your code

Things you may want to cover:

* Ruby version 2.7.0

* React version 16.8.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
