# Knotch Unit QA Challenge

## Setup Instructions
  * Verify that you have the latest version of Chrome installed.
  * Install or update ChromeDriver (`brew cask install chromedriver` or `brew cask upgrade chromedriver` on OSX with homebrew).
  * Clone this repo and `cd` into it.
  * Run `bundle install` in the repo root.

## Running Tests
  * Run `bundle exec rspec` in the repo root.
  * Test results are printed out to the terminal.

## Project Outline
  * The entire project is built with common Ruby tools and Selenium WebDriver with Chrome as the test browser.
  * Test configuration can be found in `/spec/spec_helper.rb`.
  * `rspec` is the testing framework.
  * `capybara` is used to interact with the test site and drive Selenium WebDriver.
  * `site_prism` is used to create page objects for the tests.

## Deploy Plan
  * At the very least, I would have these tests run after deploys to intermediate environments (like a QA/test environment) to check that there are no regressions or other issues with the Knotch Unit.
  * Running the tests on a schedule (such as nightly) could also be an option since the Unit is integrated on third party sites.
  * If possible, I would also have the test run before code is merged in the repo that contains the Unit, particularly if the Unit and related code are affected by recent pull requests.

## The Future
  * Adding a test case to test the animations more thoroughly could be important to add if the Knotch Unit is a critical component used for core business functionality.
  * The test rig could have its run-time reduced and made scalable by parallelizing the tests, which is supported by the tools I've used.
  * Without time constraints, I'd consider running the tests against multiple browsers and also run mobile tests. I would also test the idle animation that appears when the user is not interacting with the Unit.
  * The tests pass consistently, and they have checks to prevent flakiness. These checks could be more thorough to further ensure that they are not flaky.

## Mobile Testing
  * This test rig does not support mobile testing. A testing tool like Appium could be used for mobile testing.
