# Flowershow template E2E tests

This project is used in the [Flowershow template's](https://github.com/datopian/flowershow) `e2e` workflow to run end-to-end tests against the template. It can also be used to run the tests locally.

Although it's primary purpose is to test the Flowershow template, it can also be used to test any Flowershow-based project, e.g. to test if any customizations to it aren't breaking any basic Flowershow features.

## Run tests locally against Flowershow template or any Flowershow-based project

### `testsetup:clean`

Use this command to remove the previously tested project copy from the `test-app` folder, copy over the specified Flowershow project to it and install it's dependencies.

> Run this command only once, to install all the project dependencies in `test-app` folder. You also need to run it if the dependencies of your tested project have changed.

``` sh
# npm run testsetup:clean -- arg1
# e.g.
npm run testsetup:clean -- ../flowershow
```

### `testsetup`

There is no need to run `testsetup:clean` each time you make some changes to the template or to the fixture content folder as it would remove the whole `test-app` folder, copy the template and install all the dependencies over again. The `testupdate` script will overwrite any changed files, leaving `node_modules` untouched.

Note, it is wrapped in the `pretest` script, so it will run each time you run the `test` script - no need to run it manually.

``` sh
npm run testupdate
```

### `test`

Run tests:

``` sh
npm run test
```

See [this Playwright docs page](https://playwright.dev/docs/test-cli) to learn about different playwright CLI options, e.g. how to run only selected tests.

## Use this project in your Flowershow-based project's CI

Copy and adapt [this workflow](https://github.com/datopian/flowershow/blob/main/.github/workflows/e2e.yml).
