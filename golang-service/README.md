# Application information
This demo projects features:
- a simple go application that fetches the latest release on a given Github repository and forwards the information as a [CloudEvent](https://cloudevents.io/) to an endpoint. This component runs on a schedule.
- a simple go application that is listening for CloudEvents and displays them in STDOUT (Currently. It will have and webinterface in future)
## Setup Github Actions
Both applications are packaged inside container images and published on [Dockerhub](https://hub.docker.com/). This is achieved by using Github actions. As this demo project is a monorepo, we will run separate pipeline for each application. We are not using workflow templates for the sake of simplicity, looking at a solution that will reduce code repetition should be a case in production. 

**Also note that in a real production scenario, you want to have the each application code in a separate repository, with pipelines for each application that will do tests before push!**


## Links
Infra:
- https://hub.docker.com/repositories
Guides:
- https://docs.docker.com/ci-cd/github-actions/
- https://docs.github.com/en/actions/publishing-packages/publishing-docker-images
- https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions

