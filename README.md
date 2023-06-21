# Flowershow template E2E tests

This project is used in the [Flowershow template's](https://github.com/datopian/flowershow) `e2e` workflow to run end-to-end tests against the template. It can also be used to run the tests locally.

Although it's primary purpose is to test the Flowershow template, it can also be used to test any Flowershow-based project, e.g. to test if any customizations to it aren't breaking any basic Flowershow features.

## Run tests locally against Flowershow template or any Flowershow-based project

Run `testsetup` script, passing the path to the Flowershow template (or any Flowershow-based project you want to run the tests against) as an argument.

``` sh
# npm run testsetup -- arg1
# e.g.
npm run testsetup -- ../flowershow
```

The script will:
1. Copy the Flowershow template to `test-app` directory.
2. Replace its `/content` folder with `/fixtures/content`.
3. Install the dependencies of the copied template and build it.

Then run `test` script.

``` sh
npm run test
```

## Use this project in your Flowershow-based project's CI

Copy and adapt [this workflow](https://github.com/datopian/flowershow/blob/main/.github/workflows/e2e.yml).
