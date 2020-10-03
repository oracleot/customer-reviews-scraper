# User Reviews Scraper

User reviews go a long way in helping businesses and individuals make mission-critical decisions. Hence, the creation of apps like this, that helps to scrape the internet for useful information.

This version of the app is designed for movie lovers to check out reviews of movies by critics and the audience, from the famous Rotten Tomatoes (an American review-aggregation website for film and television)

![screenshot](./app_demo.gif)

## Built With
* Ruby
* Nokogiri

## How the app works
This project which focuses on giving users critic and audience reviews on any choice of movie indicated by the user works with the logic detailed below:
- The app asks the user for their desired movie title, this undergoes a set of verification provided by some methods in the Scraper class
- The title provided by the user is verified using the #title_valid?
- If the title provided is valid, a movie url is generated using the #generate_url
- Then the generated url is further verified to make sure it is available on Rotten Tomatoes using the #url_valid?
- If the url is valid the Scraper scrapes the Rotten Tomatoes url for available critic and audience reviews using the #scrape_movie
- The final array returned by the #scrape_movie is returned by the #generate_arr of the Spider class

## Video Explanation
Here is the [video explanation](https://www.loom.com/share/2f21d9d832864e478a11af36f318d9e2) of this project.

## Live Demo
[![Run on Repl.it](https://repl.it/badge/github/oracleot/user-reviews-scraper)](https://repl.it/@oracleot/User-Reviews-Scraper)

## Prerequisities
To get this project up and running locally, you must already have little experience working with Ruby and have it installed

## Setting up project
**Step 1: ** Clone the repo

`git clone git@github.com:oracleot/user-reviews-scraper.git`

**Step 2: ** Move into project directory

`cd user-reviews-scraper`

**Step 3: ** Install necessary gems

`bundle install`

**Step 4: ** Run the app

`bin/main`

## Testing
Simply run `rspec` from the root directory

## Author
👤 **Damilola Oduronbi**

Github: [/oracleot](https://github.com/oracleot)<br />
LinkedIn: [/doduronbi](https://www.linkedin.com/in/doduronbi/)

## Contributing
Ideas are welcome! Feel free to visit the issues page to drop your suggestions

## License
This project has no license
