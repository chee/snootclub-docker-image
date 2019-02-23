workflow "build" {
  on = "push"
  resolves = ["publish image"]
}

action "build the latest image" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build . -t latest"
}

action "filter out anything that isn't a release" {
  uses = "actions/bin/filter@24a566c2524e05ebedadef0a285f72dc9b631411"
  args = "tag"
  needs = ["build the latest image"]
}

action "log in to docker" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["filter out anything that isn't a release"]
}

action "publish image" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["log in to docker"]
  args = "push snootclub/snoot:latest"
}
