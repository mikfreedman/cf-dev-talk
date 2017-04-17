## Cloud Foundry for developers

This talk covers the following

1. Routing
  * Services
1. The Cloud Foundry CLI
  * Plugins
  * CF Trace
1. Services
  * User Provided
  * Programmatic Access
1. Debugging Java
  * The Buildpack
  * Remote Debug

Here are some interesting links from the talk

Page                   | URL
---                    | ---
Pre Shaved Yak          | http://preshavedyak.com/
Onsi's Talk on Diego   | https://youtu.be/1OkmVTFhfLY
Autopilot (Blue Green) | https://github.com/concourse/autopilot
The Twelve Factor App  | http://12factor.net/
jq (JSON)              | https://stedolan.github.io/jq/
cf CLI                 | https://docs.cloudfoundry.org/devguide/installcf/
Route Services         | http://docs.cloudfoundry.org/services/route-services.html


This repository contains all the demo applications used during the talk


## Setting up the apps

#### ba-route-service

    cf push
    cf create-user-provided-service basic-auth -r https://basic-auth-route-service.local.pcfdev.io
    cf bind-route-service local.pcfdev.io basic-auth --hostname spring-example

### logging-route-service 

    cf push
    cf create-user-provided-service logging -r https://logging-route-service.local.pcfdev.io
    cf bind-route-service local.pcfdev.io logging --hostname maintenance
    cf bind-route-service local.pcfdev.io logging --hostname sinatra
    cf bind-route-service local.pcfdev.io logging --hostname spring-example

### maintenance

    cf push

### sinatra

    cf push
    cf routes
    cf map-route maintenance local.pcfdev.io -n sinatra
    cf unmap-route sinatra local.pcfdev.io -n sinatra

### spring-example

This project uses the buildpack at: https://github.com/mikfreedman/java-buildpack . You **have** to fork the buildpack to set the debug flag - be sure your fork is always up to date.


    cf push
    cf ssh -T -L 8000:localhost:8000 spring-example

Check this stack question for a guide on how to setup intellij for remote debugging, there are similar guides available for other IDEs like eclipse
