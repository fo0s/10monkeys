#  ![monkey reading book](views/images/monkey_reading_book-thumb.png) 10monkeys
> Recreating the [Infinite monkey theorem](https://en.wikipedia.org/wiki/Infinite_monkey_theorem) using Ruby

[![Coverage Status](https://coveralls.io/repos/github/fo0s/10monkeys/badge.svg?branch=master)](https://coveralls.io/github/fo0s/10monkeys?branch=master)
[![Build Status](https://travis-ci.org/fo0s/10monkeys.svg?branch=master)](https://travis-ci.org/fo0s/10monkeys)

### For full documentation on the logic please refer to the [Documentation file](documentation.md)

The idea is to host a ruby based web crawler/scraper on a raspberry pi and only running 10 nodes, randomly generate webpages (brute force), scraping non web words and re-create a modern series of novels using only the words found.

How long the process would take to complete depends entirely on loading the comparative materials in to be broken down into a readable database and comparing what's been found on the crawl.

## Frameworks/Technologies used

Nokigiri (Web scraping)  

Google API (Database)

## To use

### This was developed to be used on a [Raspberry pi](https://www.raspberrypi.org/) or any pc that can be left sitting for any number of time. With the results being based purely on luck, the outcome can take anything between a few hours to a few days to complete.

Clone this repo

> git clone https://github.com/fo0s/10monkeys.git

Navigate to the folder

> cd 10monkeys

Run Bundler to install dependencies

> sudo bundler install

Reference to Google APIS for database  
Reference to run the dashboard locally

