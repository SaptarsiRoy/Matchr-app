# Docker App

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

---

## 📝 Table of Contents

- [About](#about)
- [Development](#development)
- [Usage](#usage)
- [Working](#work)
- [Authors](#authors)

## 🧐 [About](#about)

Docker is one of the most widely used containerisation tools to provide OS-level virtualisation in optimum
space and time. It allows us to wrap software in small packages known an "containers" which are isolated and well
defined. Nevertheless to say, Docker is an extremely quicker and easier to handle way of managing applications.

Docker requires a setup of its own, with the docker service installed and enabled. To tone down the hustle of setting up a docker server and using it for beginners and learners, Docker App can be thought of as an alternative Docker playground on hand-held UI, where learners can start their containerisation journey in easily
understandable way and be comfortable with the analysis of general docker outputs that would be available on a
terminal simulated screen in the app. From creating new containers, customising docker images to list down the
containers that are available, Docker App has in it all.

The Docker functionalities that are made available in the app are:-

1. To create a new docker container
2. To create a customised docker image using Dockerfile
3. To list down all the available containers

## ⛏️ [Development](#development)

# Frontend

The overall UI-UX of the App has been built using [Flutter](https://flutter.dev/) framework, coded on the
[Dart](https://dart.dev/) language.

- The app offers its users to <b>Register</b> themselves for the first time, and for each subsequent uses, the users can just <b>Login</b> with their registered email ID and password. The <i>Email-Password authentication</i> from [Google Firebase](https://firebase.google.com/) has been used for Registration-Login functionality.

- As an user's guide, a <b>"How To Use"</b> referral is provided in the app itself, link to which is right there in the Home Screen of the app. General guidelines on the app functionality is mentioned in the referral.

- For better experience, each functionality of the app has been given a different screen of its own, swapping among which can be done using an <b>App Drawer</b> at the side. All the functionality screens contain a <i> loading spinner overlay</i> that occurs as and when the creation of containers or images occur. Finally there's a <b>Log screen</b> that shows the terminal output of the docker command that has been run in the backend.

- The app is also provided with a <b>Sign Out button</b> at top right coner, to simply sign out when using the app is over.

# Backend

The overall Docker server is running on an AWS instance and its public IP has been used to integrate the backend code with frontend.

For working of the app, in the backend it is needful to run the subsequent docker commands with the inputs given in by the user. For the backend functionality, The [Common Gateway Functionality (CGI)](https://docs.python.org/3/library/cgi.html) Python has been used. For the three different docker functionalities offerred, three different python files are available to work on the backend, which extract the user inputs (container name, image name, expose port numbers, etc.) by using CGI; run the subsequent command, and finally print the output.

At length, the integration between the Docker server hosting the Docker service and containing the backend python codes with the frontend app so that it can communicate with the server, is done using dart functions which eventually hit the public IP of the server instance and receive the output to be printed on the Log screen.

## 📊 [Working](#work)

To check out a working video of the Docker App, please redirect to [here](https://drive.google.com/file/d/1lbNGEJ0hVK39J7i8Bz6yNL3H_7OkwEXN/view?usp=sharing)!

## ✍️ [Author](#authors)

[Saptarsi Roy](https://www.linkedin.com/in/saptarsiroy/) - Do connect!
