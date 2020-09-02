-- Create 'pre-election_approval' table
CREATE TABLE pre_election_approval (
	Start_Date DATE NOT NULL,
	End_Date DATE NOT NULL,
	Poll VARCHAR NOT NULL,
	Approve REAL NOT NULL,
	Disapprove REAL NOT NULL,
	Spread INT NOT NULL,
	Sample INT NOT NULL,
	Population VARCHAR NOT NULL,
	PRIMARY KEY (Start_Date)
);

-- Create 'presidential_approval' table
CREATE TABLE presidential_approval (
	Start_Date DATE NOT NULL,
	End_Date DATE NOT NULL,
	Poll VARCHAR NOT NULL,
	Approve REAL NOT NULL,
	Disapprove REAL NOT NULL,
	Grade VARCHAR NOT NULL,
	Sample REAL NOT NULL,
	Population VARCHAR NOT NULL,
	Weight REAL NOT NULL,
	PRIMARY KEY (Start_Date)
);

-- Create 'trump_tweets' table
CREATE TABLE trump_tweets (
	Tweet_Id BIGINT NOT NULL,
	Date DATE NOT NULL,
	Time TIME NOT NULL,
	Text TEXT NOT NULL,
	Retweets INT NOT NULL,
	Favorites INT NOT NULL,
	PRIMARY KEY (Tweet_Id),
	FOREIGN KEY (Date) REFERENCES pre_election_approval (Start_Date),
	FOREIGN KEY (Date) REFERENCES presidential_approval (Start_Date)
);