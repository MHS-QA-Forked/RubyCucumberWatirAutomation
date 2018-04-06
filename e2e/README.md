# BudgetApp E2E Test & Automation Script
  With Cuccumber-Ruby & Watir

# Introduction
Well come to BudgetApp E2E Test & Automation Script Repo. 
This project will guide you through the Test & Test Automation Develop for  BudgetApp (\\..Roor)
Test cases are Written to validate thoroughly validate every individual features of the application   

Automation Script is develop using Below Stack
## Stack
The app was built using these aweseome technologies

- [x] [Ruby 2.5.x](https://www.ruby-lang.org/en/)
- [x] [Watir](http://watir.com/)
- [x] [Cucumber](https://cucumber.io/)
- [x] [gherkin language](https://github.com/cucumber/cucumber/wiki/Gherkin)



Cucumber-Watir Test Automation High Level Overview 
==================================================

This is a test harness for automated functional testing of web applications, using the [Cucumber](http://cukes.info/) and [Watir Webdriver](http://watirwebdriver.com/) test frameworks. It can be used to support Behavioral Driven Design (BDD) or just automated functional testing of arbitrary web applications.

By using this collection of frameworks, you can quickly start a suite of functional tests for an application using a basic vocabulary inspired by tests that have been used successfully on many production projects.

The built in steps in `features/step-definitions/common_steps.rb` cover a variety of common use cases that occur in the functional testing of web applications, including common operations such as visiting pages, filling in form fields, finding text in a page, and checking that operations complete successfully.

This approach might not be as pure as some would advocate for BDD, but it strikes a good balance between being implementation specific and being fast to write and execute.

Here is an example of a Cucumber scenario written with the common steps:

![BDD Flow](https://github.com/mdrasul/RubyCucumberWatirAutomation/blob/master/e2e/ReadmeAsset/Image%201.jpg)


framework is scripted as Page Objct Model patterns. So automation engineers Can Quickly pick an existing page object 
and utilize the encapsulated Code Behind the page class

Have look on POM Structure:

![Step to POM](https://github.com/mdrasul/RubyCucumberWatirAutomation/blob/master/e2e/ReadmeAsset/Image%203.jpg)




Setup on Mac OS X
=================

Tools Used:
-----------

1. Mac with `sudo` Access
2. Xcode with command line tools installed. The command line tools can be installed from Xcode -> Preferences -> Downloads
3. RVM (optional)
4. Ruby 2.5.0
5. Watir-Webdriver
6. webdriver-user-agent
7. cucumber
8. homebrew (optional)
9. chromedriver


Steps To Install:
-----------------

### Mac Instructions

#### Install Xcode and then install command line tools.

The command line tools can be installed in Xcode by going to Xcode-> Preferences -> Downloads


#### Check Before setup you may already 60% Installed 


#### Install RVM

		curl -L https://get.rvm.io | bash

Using a Ruby version manager will isolate the changes required for testing from the system Ruby. If you don't use rvm, you might consider [rbenv](https://github.com/sstephenson/rbenv) instead.

#### Install Ruby

		rvm install ruby-2.5.0

To make this the default ruby on your Mac run the below command. However you do not need to make it the default ruby for the test scripts to run. The `.ruby-version` file in the folder has the builin workflow to use Ruby 2.5.0 when you cd into the tests/web folder.

		rvm use ruby-2.5.0 --default

#### Install Homebrew - Optional 

		ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
		brew doctor

If the above command fails, please follow the steps in the output to fix the errors.

Installing Homebrew is optional. These directions use it to install chromedriver, but you could also use `npm` to install chromedriver or install it manually.  You can download chromedriver from https://chromedriver.storage.googleapis.com/index.html if you want to install it manually.

#### Install chromedriver

Install `chromedriver` using Homebrew or npm:

		brew install chromedriver
        # or if you prefer to install chromedriver through npm, do
        # npm install chromedriver -g

Unzip and move the driver to any place in your path such as `/usr/local/bin`.

The advantage of installing chromedriver via brew or npm is that you can update it with a single command. (`brew update && brew upgrade``)

#### Install the bundler gem

		gem install bundler --no-ri --no-rdoc

#### Install necessary gems using bundler

		bundle install

### Getting Started (Windows)

The following instructions show how to bootstrap a Windows ruby environment.

#### Download and Install Ruby
Get Ruby 2.5.0-1 (or newer) from http://rubyinstaller.org/downloads/

#### Download and install chromedriver

Get Chromedriver from http://chromedriver.storage.googleapis.com/index.html

Make sure the chromedriver is in your PATH enviroment variable.

#### From here you can follow the same instructions as above.

#### Alternatively you can simply clone the below Git repo and run your tests. The package contains all gems and utilities built-in to run the tests.

`https://github.com/ModusCreateOrg/ruby4windows.git`


Running tests
-------------

You can run the tests directly with the cucumber command, or with a set of preset command line options using the `rake` command.

First setup the Env Url in project/features/support/urls.rb file 
this is important to run test on localhost/dev/qa/prod environment 

![AUT URL](https://github.com/mdrasul/RubyCucumberWatirAutomation/blob/master/e2e/ReadmeAsset/Urls.jpg)




### Run cucumber directly

To run tests directly using Cucumber, simply issue the command:

		cucumber

The above command runs all the tests inside the feature folder but that is not what you want sometimes. To run single individual tests you have to specify the line numbers as below:.

		cucumber features/transaction.feature:217

This will run the test scenario at line number 217 in the file `features/main.feature`.

### Run cucumber using `rake`

Rake uses tasks to collect a set of functions and commands. In this project, it is used to run cucumber with command line options suitable for testing out different groups of tagged features or

To see a list of tasks, run:

		rake -T

To run the whole regression suite, run:

		rake all

An HTML report will be saved to the `results` folder with screenshots of any failures.


Tips and Troubleshooting:
--------------------------

### Sencha Command integration


### Bash alias for running tests

You can simply create Alias in your bash profile to run tests. Instead of typing the whole cucumber command create this function in your `.bashrc` or `.profile` file:

		echo 'c() { cucumber features/main.feature:"$@" ;}' >> ~/.bashrc
        . ~/.bashrc

Then you can run the test at line 217 by simply running the command below from the test folder:

		c 217

### Libxml errors

If you run into libxml erorrs fix it as suggested in this post

		https://gist.github.com/vparihar01/5856524
		
### Test Plan & Test Case Reference 


| ﻿Feature                        	| Jira #   	| TCID                  	| Scenarios                                                       	| Runmode 	| Browser  	| Platforms        	| Test Cycle 	| Comments 	|   	|
|--------------------------------	|----------	|-----------------------	|-----------------------------------------------------------------	|---------	|----------	|------------------	|------------	|----------	|---	|
| Budget-HomePage Basic Loads    	| xxxxxxxx 	| Home_Page_001         	| Load & Validate Basic Elemnts Like [Page Title, Logo]           	| N       	| ChromeFX 	| WindowsMACDevice 	| Smoke      	|          	|   	|
| Budget-HomePage Basic Loads    	| xxxxxxxx 	| Home_Page_002         	| Load & Validate Transaction Table                               	| N       	| Chrome   	| Windows          	| smoke      	|          	|   	|
| Budget-HomePage Basic Loads    	| xxxxxxxx 	| Home_Page_003         	| Load & Validate Git-Hub Link[ Star, Fork]                       	| N       	| Chrome   	| Windows          	| smoke      	|          	|   	|
| Budget-Transaction             	| xxxxxxxx 	| Budget-Transaction001 	| Perform A income Transaction Validate Inflow & Balance          	| Y       	| Chrome   	| Windows          	| Regression 	|          	|   	|
| Budget-Transaction             	| xxxxxxxx 	| Budget-Transaction002 	| Perform A Expense Transaction Validate Outflow & Balance        	| Y       	| Chrome   	| Windows          	| Regression 	|          	|   	|
| Budget-ReportPage Basic Loads  	| xxxxxxxx 	| Home_Report_001       	| Load & Validate Basic Elemnts Like [Page Title, Logo]           	| N       	| ChromeFX 	| WindowsMACDevice 	| smoke      	|          	|   	|
| Budget-ReportPage Basic Loads  	| xxxxxxxx 	| Home_Report_002       	| Load & Validate Basic Report Bar                                	| N       	| Chrome   	| Windows          	| smoke      	|          	|   	|
| Budget-ReportPage Basic Loads  	| xxxxxxxx 	| Home_Report_002       	| Load & Validate Basic Report Charts & Legends                   	| N       	| Chrome   	| Windows          	| smoke      	|          	|   	|
| Budget-Reporting Functionality 	| xxxxxxxx 	| Budget-Reporting1     	| Perform A income Transaction Validate Inflow vs Outflow Report  	| Y       	| Chrome   	| Windows          	| Regression 	|          	|   	|
| Budget-Reporting Functionality 	| xxxxxxxx 	| Budget-Reporting2     	| Perform A Expense Transaction Validate Inflow vs Outflow Report 	| Y       	| Chrome   	| Windows          	| Regression 	|          	|   	|
| Budget-Reporting Functionality 	| xxxxxxxx 	| Budget-Reporting3     	| Perform A Expense Transaction Validate Spending By Cate Report  	| Y       	| Chrome   	| Windows          	| Regression 	|          	|   	|
