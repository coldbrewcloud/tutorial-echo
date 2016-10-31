# Tutorial - Simple Echo Server

This is a sample project to demonstrate how to run an HTTP service on AWS using [coldbrew-cli](https://github.com/coldbrewcloud/coldbrew-cli). The sample application in this tutorial is simply return the HTTP request body data in the HTTP response.

## 0. Prerequisites

#### Docker

Install [Docker](https://docs.docker.com/engine/installation/) in your system. Make sure you can run `docker` from your command line.

#### coldbrew-cli

Install [coldbrew-cli](https://github.com/coldbrewcloud/coldbrew-cli/wiki/Downloads). 

#### AWS Account Keys

You will need [AWS access keys](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html) to configure **coldbrew-cli**. Either set the [environment variables](https://github.com/coldbrewcloud/coldbrew-cli/wiki/CLI-Environment-Variables) or use [CLI Global Flags](https://github.com/coldbrewcloud/coldbrew-cli/wiki/CLI-Global-Flags).

## 1. Clone This Repo

```bash
git clone https://github.com/coldbrewcloud/tutorial-echo.git
cd tutorial-echo
```

This project contains
- echo: compiled application binary (Linux 64bit)
- [Dockerfile](https://github.com/coldbrewcloud/tutorial-echo/blob/master/Dockerfile): sample Dockerfile
- [coldbrew.conf](https://github.com/coldbrewcloud/tutorial-echo/blob/master/coldbrew.conf): sample [coldbrew-cli](https://github.com/coldbrewcloud/coldbrew-cli) app configuration file
- [Makefile](https://github.com/coldbrewcloud/tutorial-echo/blob/master/Makefile): application build Makefile

_*Compiled binary `echo` is included, but, if you want,, you can modify its source [main.go](https://github.com/coldbrewcloud/tutorial-echo/blob/master/main.go) and recompile it by running `make build`._

## 3. Create a Cluster

Before you can deploy the application, you need to create your first cluster. You can create the cluster using [cluster-create](https://github.com/coldbrewcloud/coldbrew-cli/wiki/CLI-Command:-cluster-create) command.

```bash
coldbrew cluster-create tutorial --disable-keypair
```

<img src="https://raw.githubusercontent.com/coldbrewcloud/assets/master/coldbrew-cli/tutorial-eho-cluster-create.gif?v=1" width="800">

_*In this tutorial, `--disable-keypair` flag was used to skip assigning EC2 key pairs to ECS Container Instances, but, that's not recommended if you need to access the instances directly (e.g. via SSH)._

_*It will take a couple of minutes until all EC2 Instances (ECS Container Instances) finish initialization and register to ECS Cluster. But you can proceed to deploy your app._

## 4. Deploy App

Now you use [deploy](https://github.com/coldbrewcloud/coldbrew-cli/wiki/CLI-Command:-deploy) command to build the Docker container image and deploy it to AWS ECS.

```bash
coldbrew deploy
```

<img src="https://raw.githubusercontent.com/coldbrewcloud/assets/master/coldbrew-cli/tutorial-echo-deploy.gif?v=1" width="800">

Now you just need to wait a couple more minutes _(or even less if it's not the first deploy)_ until all AWS resources get fully configured.

## 5. Check the Status

Use [status](https://github.com/coldbrewcloud/coldbrew-cli/wiki/CLI-Command:-staus) command to see the current running status of your app.

```bash
coldbrew status
```
<img src="https://raw.githubusercontent.com/coldbrewcloud/assets/master/coldbrew-cli/tutorial-echo-status.gif?v=1" width="800">

## 6. Clean Up

You can delete all resources for the app and cluster using [deploy](https://github.com/coldbrewcloud/coldbrew-cli/wiki/CLI-Command:-delete) and [cluster-delete](https://github.com/coldbrewcloud/coldbrew-cli/wiki/CLI-Command:-cluster-delete) respectively.

```bash
coldbrew delete
```

<img src="https://raw.githubusercontent.com/coldbrewcloud/assets/master/coldbrew-cli/tutorial-echo-delete.gif?v=1" width="800">

```bash
coldbrew cluster-delete tutorial
```

<img src="https://raw.githubusercontent.com/coldbrewcloud/assets/master/coldbrew-cli/tutorial-echo-cluster-delete.gif?v=2" width="800">
