### Introduction
This is a simple proof-of-concept library showing an example of how to develop automation using Selenium in Ruby using rspec. The app under test (https://thinking-tester-contact-list.herokuapp.com) is a free website provided by Kristin Jackvony and I am not affiliated in any way with the author. I would like to thank her for providing a simple website for automators to practice their automation.

### Instructions

#### Repo Demo

Use the folowing command to run the demo:
```
ruby demo.rb
```
The demo covers the basic ui functionality which will be executed by the tests in the ./tests/ directory

#### Running the tests in the ./tests/ directory

Use the folowing command to run the repo:
```
rspec --pattern "**/*.rb" ./tests/
```

### Repo Structure
#### ./api_objects/
This is the directory where the API objects are stored. If you are familiar with the Page Object Model (POM) in test automation, this is a very similar concept but for APIs. The API calls are structured in a way that logically matches the documentation found here: https://documenter.getpostman.com/view/4012288/TzK2bEa8.

Note that this will be different from how the POM typically organizes pages. This is intentional--even though the ui actions should be equivalent to api actions, they are two different systems and each model should reflect the system it is designed to test.

#### ./helpers/
This is a collection of helper libraries. These are the low-level interfaces between systems. For example, **api_helper.rb** is what puts together the API headers and body and actually accesses the API library. The various **./api_objects/** classes simply collect and format the data to be sent.

If this application supported SQL testing, or if I was logging the results to a database, there would be a **db_helper.rb** as well.

#### ./page_objects/
This is a collection of page objects which are designed to serve as subject matter experts on each page of the application for the automation. They keep a collection of object references and common functions that are responsible for any interaction that a script might need to have with a page.

The advantage of this style of automation is it enables us to more quickly fix broken tests. For example, if a button's reference is changed, we need to update the page object that defines that button rather than every script where that button is interacted with.

#### ./tests/
This is a collection of rspec tests organized around the test cases that might be written for this application. As both API and UI tests are supported, they are included in every test in the library. If you are running the repo using the command above, you will notice breaks in-between the UI tests, this is the API test execution.

You will notice that each script is independent of every other script. This is intentional as the failure of one test won't cause a cascade effect. This means some functionality (in particular, login) will be duplicated throughout the testing process, but it is considered best practice as it limits false failures.