
#######################################################################################################
#
#   Hive - Create table and populate it with data
#
#######################################################################################################

CREATE TABLE ztable (name VARCHAR(64), age INT, rating DECIMAL(3, 2)); 
INSERT INTO TABLE ztable VALUES ('frank', 25, 3.28), ('dean', 32, 2.92);
SELECT * FROM ztable;

# Then create snapshot of Hive table (called "ztable").

hdfs dfsadmin -allowSnapshot /apps/hive/warehouse/ztable
hdfs dfs -createSnapshot /apps/hive/warehouse/ztable zSnapshot1



#######################################################################################################
#
#   Distcp snapshot to target location
#
#######################################################################################################

# Create target directory
hadoop fs -mkdir /dztest

# List snapshots (this should display 1 snapshot, "zSnapshot1" within /apps/hive/warehouse/ztable/.snapshot/zSnapshot1)
hadoop fs -ls /apps/hive/warehouse/ztable/.snapshot

# Copy Snapshot to new target location (which can be intra-cluster or within remote cluster)
hadoop distcp hdfs://172.26.196.165:8020/apps/hive/warehouse/ztable hdfs://172.26.196.165:8020/dztest/ztable

hdfs dfsadmin -allowSnapshot /dztest/ztable

# Create snapshot within target
hdfs dfs -createSnapshot /dztest/ztable zSnapshot1

# Make sure snapshot is in there
hadoop fs -ls /dztest/ztable/.snapshot



#######################################################################################################
#
#   Hive - Insert new records
#
#######################################################################################################

INSERT INTO TABLE ztable VALUES ('sammy', 35, 1.28), ('joey', 37, 1.92);
SELECT * FROM ztable;

# Then create new snapshot of "ztable", which contains additional records. The new snapshot is called "zSnapshot2"

hdfs dfs -createSnapshot /apps/hive/warehouse/ztable zSnapshot2



#######################################################################################################
#
#   Distcp snapshot to target location (with diff option)
#
#######################################################################################################

hadoop distcp -diff zSnapshot1 zSnapshot2 -update hdfs://172.26.196.165:8020/apps/hive/warehouse/ztable hdfs://172.26.196.165:8020/dztest/ztable

# Create new snapshot within target
hdfs dfs -createSnapshot /dztest/ztable zSnapshot2

# Make sure all snapshots are in there
hadoop fs -ls /dztest/ztable/.snapshot



#######################################################################################################
#
#   Cleanup / Remove any old Snapshots
#
#######################################################################################################

hdfs dfs -deleteSnapshot /dztest/ztable zSnapshot1


#ZEND
