#Reconcile App 
##is a great way to manage your shared expenses.
----
It's when you spend money on something and people owe you for
it. Think buying a case of beer or some eggs for your
roommates. Think the weekly movie outing or rum night with your
project team. Think gas and car rental money when you go on a
roadtrip with your buddies. Think the lawn rental for tennis
nights with your sports pals.

All these are examples when you, or someone else pays for
others. Reconcile App allows you to manage these numerous micro
transactions and make sure you settle with everyone you owe money
to and with everyone who owes you some.

----

##Installation

It is very straight forward to get an instance of the reconcile app up
and running. It is a standard Rails project that works well with any
popular relational database server. It has been tested with Postgres.

### Using Heroku PaaS

We strongly recommend using the Heroku free tier to host your instance
of Reconcile App. The following steps assume that you are going to use
a GNU/Linux or an OS X machine to set up your instance of Reconcile
App:


1. Run `git clone git://github.com/hyfather/reconcileapp.git` from the
directory where you'd like to keep your copy of Reconcile App.
2. If you use `rvm` to manage your gems, create a new gemset for
reconcile app and run `bundle`. If you don't use `rvm` to manage your
gems, but like to keep the gems for Reconcile App separate, run
`bundle install --path .bundle`
3. After this, ensure that all the tests are passing by running
`bundle exec rake`.
4. If you want to see Reconcile App run locally, you can run `bundle
exec rails server` and see the app on `localhost:3000`.
5. At this point, you should head over to www.heroku.com and sign
up. Download their latest toolbelt and authenticate with your
credentials and run `heroku create` to create a new single dyno free
app.
6. Then push out Reconcile App using `git push heroku master`.

----

###Using your own server or an IaaS host

Reconcile App has a very standard rails configuration and will work
great on the default stack. You can set it up using Passenger over
Apache HTTP Server or NginX, you can use Unicorn or you can use JRuby
with tomcat. Any standard guide to deploy a Ruby on Rails on your own
server will work great. There are no hidden surprises.
I'd appreciate it if you detail the process and stick it up here!

----
