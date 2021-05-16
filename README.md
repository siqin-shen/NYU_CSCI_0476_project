# NYU_CSCI_0476_project
It's a short writeup and code display of my personal part of or group project

My code is to figure out how many trees are in "alive" status and in good health in each borough, and what are the tree species. And based on the total tree number for each borough to determine whether the boroughs have healthy green land.

--1. Raw data ingest:
	hdfs dfs -put 2015_Street_Tree_Census_-_Tree_Data.csv project

--2. Run MapReduce to count the total records in raw data:
	javac -classpath `yarn classpath` -d . CountRecs.java CountRecsMapper.java CountRecsReducer.java
	jar -cvf CountRecs.jar *.class
	hadoop jar CountRecs.jar CountRecs project/2015_Street_Tree_Census_-_Tree_Data.csv project/output1

--3. Run MapReduce to clean the raw data: delete records with abnormal length and records with "not-borough-name" in the borough column.
	javac -classpath `yarn classpath` -d . Clean.java CleanMapper.java CleanReducer.java
	jar -cvf Clean.jar *.class
	hadoop jar Clean.jar Clean project/2015_Street_Tree_Census_-_Tree_Data.csv project/output2

--4. Run MapReduce to count the total records in cleaned data:
	hadoop jar CountRecs.jar CountRecs project/output2/part-r-00000 project/output3

--5. MapReduce data profiling: Just simply see if there's any records with "not-borough-name" left.
	javac -classpath `yarn classpath` -d . BoroughCounts.java BoroughCountsMapper.java BoroughCountsReducer.java
	jar -cvf BoroughCounts.jar *.class
	hadoop jar BoroughCounts.jar BoroughCounts project/output2/part-r-00000 project/output4

--6. Download cleaned data to local, rename it as "Cleaned_Dataset", and upload it.
	hdfs dfs -get project/output2/part-r-00000 /home/ss12083/project_data
	hdfs dfs -put Cleaned_Dataset project
  
And the further parts are using Impala to find the count of each property and then find the distribution. Code are attached.
