# meteor-builder

Meteor Docker image for building Meteor projects using Buildkite agent

## Docker Hub image

Docker image available at https://hub.docker.com/r/zulhilmizainuddin/meteor-builder-buildkite/

Docker pull command
```
docker pull zulhilmizainuddin/meteor-builder-buildkite
```

## Prerequisite

Make sure the Meteor project to be built includes a `.meteorignore` and `.dockerignore` file with the following contents.

`.meteorignore`
```
output/
```

`.dockerignore`
```
*
!output/
```

## Build steps

1. Run `npm install`.

```
$ docker run --rm -v $(pwd):/home/buildkite-agent/app zulhilmizainuddin/meteor-builder-buildkite meteor npm install
```

2. Run `tsc` (if TypeScript project).
```
$ docker run --rm -v $(pwd):/home/buildkite-agent/app zulhilmizainuddin/meteor-builder-buildkite meteor tsc --skipLibCheck
```

3. Run `npm test`.
```
$ docker run --rm -v $(pwd):/home/zulhilmizainuddin/app zulhilmizainuddin/meteor-builder-buildkite meteor npm test
```

4. Run `meteor build`.
```
$ docker run --rm -v $(pwd):/home/buildkite-agent/app zulhilmizainuddin/meteor-builder-buildkite meteor build --directory output
```