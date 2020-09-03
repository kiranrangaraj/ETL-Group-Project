# ETL-Group-Project
ETL Group Project for Data Analytics Bootcamp - Final Report

For our ETL project, we extracted, transformed and loaded data relating to President Trump's tweets compared to his approval ratings at the same point in time. The results would be useful to any campaign manager/agency in observing how tweets and their reactions affect the population's acceptance of the candidate. We decided SQL would be the best ending format for our relational database, so our goal was to create csvs for all individual datasets and load them into Postgres. 

The first dataset we found was a list of approval ratings in the form of a csv.file on https://projects.fivethirtyeight.com/trump-approval-ratings, but the data started in 2017 and we wanted to include 2016 ratings. We pulled 2016 ratings from https://www.realclearpolitics.com/epolls/other/trump_favorableunfavorable-5493.html#polls and used pandas read_html function to parse the url, then cleaned the data and saved to a csv file. 

Next we wanted to pull actual Twitter info: ids, dates, retweets, favorites, etc. In order to add more complexity in our data extraction, we decided to each attempt one way of pulling tweets from Twitter. 

Michelle: My initial attempt was to parse Donald's twitter page using beautiful soup and splinter/selenium. After trying multiple versions of code with no success, I moved on to try the same code on a couple other webpages that had less tweets, thinking the notebook was overwhelmed. It turns out Twitter has barriers preventing complete visibility to the tweet's code and thats was what was causing the error. Even the other webpages were subliminally referring to Twitter's html. I ended up finding and dowloading a json file with Trump's tweets from 2016 and called it a day. I transformed the file into pandas dataframe, cleaning and renaming the data in order to merge with Kiran's. 

Kiran: <<< i thought you may explain what you did better than i can >>>>>>

After merging our two pandas dataframes, we then exported the pd to a csv file. 

Once in SQL, we created a database and tables within to load our CSVs into. 

While the end visual of our ETL project looks fairly simple, it took a lot of attempts and failures in data extraction, a real learning process in summary!
