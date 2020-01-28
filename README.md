Angular Tutorial
================

Simple and quick step-by-step tutorial guide for Angular application.

Uses docker (>=17.05) container setup for easy development.

## Guide

### Step 0 - Environment setup

**Goal:** Create the development docker image

1. create the docker image as configured in the _docker-compose.yml_
    ````
    docker-compose build
    ````
1. on *nix system, test container can be created correctly
    ````
    run_docker.sh
    ````

### Step 1 - Create the Angular application

**Goal:** Default angular application using docker

1. start docker container
    ````
    run_docker.sh
    ````
1. quick check the directory location and ensure it is mapped to local development by running this and checkout the output
    ````
    /wip# ls -al
    ````
1. create new application using Angular CLI
    ````
    ng new angular --routing true --enableIvy true
    ````
    select the desired options through the interactive menus
1. update _package.json_ with these scripts for quick DEV commands
    ````
    "start:dev": "ng serve --host 0.0.0.0",
    ````
1. in the container start the Angular application
    ````
    /wip/angular# npm run start:dev
    ````
1. check the application on host browser
    ````
    http://localhost:4200/
    ````
    ![default angular application homepage][default_angular_app]

[default_angular_app]: doc/default-angular.png "Default Angular Application"

### Step 2 - Create first UI components

**Goal:** Create simple _homepage_ UI components: [Home, About]

Refactor the default Angular application into frame and _home_ component.  Also create a new _about_ component to allow switching between 2 URLs that maps to the 2 components.

1. create a feature module to contain the components
    ````
    ng generate module homepage --module app --routing true
    ````
1. create the components
    ````
    ng generate component homepage/home --module homepage
    ng generate component homepage/about --module homepage --style scss
    ````
1. update the route to show the components ... _homepage-routing.module.ts_
    ````
    const routes: Routes = [
      { path: 'home', component: HomeComponent },
      { path: 'about', component: AboutComponent },
    ];
    ````
1. test the new path, /home and /about
    ````
    http://localhost:4200/home
    http://localhost:4200/about
    ````
