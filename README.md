# 2016-2020 Trump Tweets & Approval Rating Extraction, Transformation, Loading (ETL)

## Summary ##

This project extracted, transformed and loaded Donald Trump's Tweets and his approval ratings from the 2016 pre-election year through all four years of his presidency. The data was extracted from various sources using different methods, which included downloading a CSV and a JSON file, parsing a HTML table from its URL, and querying Tweets directly from Twitter using the Python library GetOldTweets3. All data transformation was conducted using Python Pandas and saved as CSV output files. 

A relational database appropriate for the data was modeled and engineered using PostgreSQL. Finally, the output CSV files were loaded into the database from which queries could be run in order to analyze the data. Hypothetically, the queries could be structured to assess several aspects of the Tweets which could be useful to a campaign manager or agency concerned with how a political candidate or politician's Tweets affect public reaction and ultimately impacts the general population's approval of the candidate.

---

## Process ##

### Approval Rating Extraction and Transformation

#### 2016 Pre-election Year
* 2016 approval ratings were extracted from an html table on the website [Real Clear Politics](https://www.realclearpolitics.com/epolls/other/trump_favorableunfavorable-5493.html#polls) using Python Pandas "read_html" function to parse the URL into a data frame. 
* The data frame was then cleaned which including renaming and splitting columns, filtering for data from 2016, converting the date to a datetime format, dropping duplicate time frames, changing column order, and sorting the approval ratings according to date.
* The columns included "Start Date", "End Date", "Poll", "Approve (%)", "Disapprove (%)", "Spread", "Sample", and "Population".
* The cleaned data frame was saved as a new output CSV file ready to be loaded into the database.
#### 2017 - 2020 Presidential Years
* A CSV data set containing approval ratings during Trump's presidency was located at the website [FiveThirtyEight](https://projects.fivethirtyeight.com/trump-approval-ratings).
* Columns were reordered to be consistent with the previous cleaned data frame, null value rows and duplicate 'Start Dates' were dropped, and the date was converted to a datetime format.
* The cleaned data frame was also saved as a new output CSV file ready to be loaded into the database.

### Tweet Extraction and Transformation

#### 2016 Tweets
* A [GitHub Repository](https://github.com/bpb27/trump_tweet_data_archive) containing JSON files of Trump's Tweets was located.
* The JSON file was loaded into Python using Pandas "read_json" function.
* The data frame was transformed which involved filtering for original Tweets (dropping Retweets), dropping unnecessary columns, renaming the columns, splitting the "Datetime" column into "Date" and "Time", and sorting the Tweets according to date.
* The cleaned data frame was then saved as a new output CSV file.

### 2017-2020 Presidential Tweets
* Scraping Trump’s tweets from Twitter in Python was the most direct way of extracting the data, however the standard Twitter API only allows a retrieval of Tweets up to 7 days ago and is limited to scraping 18,000 Tweets per a 15 minute window. This wasn't practical given the 4-year time span of Tweets needing to be extracted. 
* Instead, there are two Python libraries that allow Twitter scraping. The first is Tweepy, which uses Twitter's API and has limitations of up to 3,200 of the most recent Tweets by a single user. The second is GetOldTweets3, which simply queries Tweets without limitations on the number of Tweets nor the date span. Both require simple PIP installs.
* Once installed, a query was coded which specified for Trump's Twitter ID "realDonaldTrump", dates spanning "2017-01-01" - "2020-09-02", and a maximum of 15,000 Tweets.
* Specific Tweet information was also specified as a list comprehension and the scraped data was loaded into a Pandas data frame.    
* 
* Also, using Tweepy you’re only able to return up to 3,200 of a user’s most recent tweets.
*   Our main objective was to compile a comprehensive database of Trump’s tweets both during his presidency and his 2016 presidential campaign. There are two libraries that allow you to do this: Tweepy, which uses Twitter’s API and GetOldTweets3 which simply queries tweets. Both require simple pip installs. Tweepy relies on the standard API that only allows for tweets up to 7 days ago to be extracted. Whereas GetOldTweets3 allows for larger amounts of tweets and tweets older than a week to be retrieved. Thus it was suitable for our data extraction. I utilized the install to build a query based on Trump’s specific Twitter username and the desired date span. A list comprehension was compiled to specify which tweet data was pertinent, which was then assembled into a Pandas data frame. The data frame was then saved as a raw tweet CSV file.
*


We decided SQL would be the best ending format for our relational database, so our goal was to create CSV's for all individual datasets and load them into PostgreSQL. 

The first dataset we found was a list of approval ratings in the form of a csv.file at [FiveThirtyEight](https://projects.fivethirtyeight.com/trump-approval-ratings), but the data started in 2017 and we wanted to include 2016 ratings. We pulled 2016 ratings from https://www.realclearpolitics.com/epolls/other/trump_favorableunfavorable-5493.html#polls and used pandas read_html function to parse the url, then cleaned the data and saved to a csv file. 

Next, actual Twitter info including "ids", "dates", "retweets", "favorites", etc were extracted using two different methods.

Michelle: My initial attempt was to parse Donald's twitter page using beautiful soup and splinter/selenium. After trying multiple versions of code with no success, I moved on to try the same code on a couple other webpages that had less tweets, thinking the notebook was overwhelmed. It turns out Twitter has barriers preventing complete visibility to the tweet's code and thats was what was causing the error. Even the other webpages were subliminally referring to Twitter's html. I ended up finding and dowloading a json file with Trump's tweets from 2016 and called it a day. I transformed the file into pandas dataframe, cleaning and renaming the data in order to merge with Kiran's. 

Kiran: Scraping President Trump’s tweets from Twitter in Python was the most direct way of extracting our raw data. Our main objective was to compile a comprehensive database of Trump’s tweets both during his presidency and his 2016 presidential campaign. There are two libraries that allow you to do this: Tweepy, which uses Twitter’s API and GetOldTweets3 which simply queries tweets. Both require simple pip installs. Tweepy relies on the standard API that only allows for tweets up to 7 days ago to be extracted. Whereas GetOldTweets3 allows for larger amounts of tweets and tweets older than a week to be retrieved. Thus it was suitable for our data extraction. I utilized the install to build a query based on Trump’s specific Twitter username and the desired date span. A list comprehension was compiled to specify which tweet data was pertinent, which was then assembled into a Pandas data frame. The data frame was then saved as a raw tweet CSV file. 

Pandas was then used again to read the CSV file and transform the data into a format that was useable for our considerations. The cleaned-up data frame was then saved as a separate output CSV file to be concatenated with our data frame containing Trump’s tweets from 2016. Once concatenated, the comprehensive CSV file was ready to imported into our SQL database.

We loaded our CSV files into a SQL database constructed of three tables. The relational aspect of the database is illustrated by how the tables have foreign keys that reference the primary key of the other table. 

While the end visual of our ETL project looks fairly simple, it took a lot of attempts and failures in data extraction, which turned out to be a real learning process!

---

## Sources ##
### Data
* https://twitter.com/realDonaldTrump
* https://github.com/bpb27/trump_tweet_data_archive
* https://projects.fivethirtyeight.com/trump-approval-ratings
* https://www.realclearpolitics.com/epolls/other/trump_favorableunfavorable-5493.html#polls
### Python Libraries
* https://www.tweepy.org/
* https://pypi.org/project/GetOldTweets3/

---

## Technologies Used ##
* Python - Pandas, NumPy, Datetime, GetOldTweets3
* PyCharm - Python IDE
* Jupyter Notebook
* PostgreSQL
* pgAdmin 4 - PostgreSQL IDE

---

## Authors ##
Kiran Rangaraj and Michelle Crawford Hannah - Vanderbilt University 2020
