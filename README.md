## MeteorApp - Meteor Runtime for App Engine

### Requirements
- [Docker](https://www.docker.com/)
- [Google Cloud SDK](https://cloud.google.com/sdk/gcloud/)
- [App Engine Component](https://cloud.google.com/sdk/gcloud-app)

### Getting started

#### Setup
Add the following `Dockerfile` into the root of your app:
~~~shell
FROM tastytoast/meteorapp:build
~~~

Make sure your app has a valid [`app.yaml`](https://cloud.google.com/appengine/docs/managed-vms/config) file. It should look something like the following:

~~~yaml
runtime: custom
vm: true
api_version: 1

handlers:
  - url: .*
    script: dynamic

env_variables:
  NODE_ENV: production
  ROOT_URL: http://[my-project-id].appspot.com
  MONGO_URL: mongodb://mymongourl
~~~

This file sets two very important environment variables. `ROOT_URL` and `MONGO_URL`. The `ROOT_URL` variable is the domain of the app. (In this case, it's App Engine's default domain.) `MONGO_URL` is the url of your MongoDB database.  This image currently. You can set up your own MongoDB cluster on the [Google Cloud Platform](https://cloud.google.com/solutions/mongodb/click-to-deploy) or use a managed service like [MongoLab](https://mongolab.com/)

You will also need to make sure your app is responding to App Engine's [health checks](https://cloud.google.com/appengine/docs/managed-vms/config#health_checking). You can disable this by adding the following to your app.yaml file

~~~yaml
health_check:
  enable_health_check: False
~~~

#### Deploy to App Engine

Deploy with the following command
~~~shell
gcloud preview app deploy app.yaml
~~~

This will create a new version of your app.  You deploy to the default version with the `--set-default` command.
~~~shell
gcloud preview app deploy app.yaml --set-default
~~~

###Known Issues
Currently you must handle App Engine's [health checking](https://cloud.google.com/appengine/docs/managed-vms/config#health_checking) in your app.  You can disable this in app.yaml.  A future version of this image will automatically handle these checks for you.

Websockets are disabled by default until a better solution can be found.  You can get this to work with a static IP and setting up port forwarding in your app.yaml. Make sure you enable websockets.
~~~yaml
network:
  forwarded_ports: ["3000"]

env_variables:
  DISABLE_WEBSOCKETS: 0
~~~
