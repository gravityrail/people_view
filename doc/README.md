# API Documentation

NationBuilder offers a RESTful API that you can use to build great apps to
expand and interact with your existing nations.


## Basic Concept

Since this is an early preview of the API, only admin accounts have the
access to create, authenticate, and consume API at this moment, but this will
change in the future.

To start, you will need to create a new OAuth Application in your nation's control panel.


## Authentication

NationBuilder API uses [OAuth 2](http://oauth.net/2/). In order to access the
API, you will need to create a new OAuth Application in your nation's control
panel. Once you have done this, you will receive a Consumer Key and a Consumer Secret.

Below is a list of OAuth 2 Authorization Endpoints provided by NationBuilder API:

**Authorize URL**

```
https://<nation_slug>.nationbuilder.com/oauth/authorize
```

**Token URL**

```
https://<nation_slug>.nationbuilder.com/oauth/token
```


## Endpoints

### People

### Survey