<h3>Hadoop Cluster - Disaster_Recovery</h3>
Resources, tricks, and recommendations for DR (Disaster Recovery) Hadoop clusters
<br>
<br><b>HDFS - DR Best Practices & Strategies:</b>
<br>
<br>Use <a href="https://hadoop.apache.org/docs/r2.7.3/hadoop-project-dist/hadoop-hdfs/HdfsSnapshots.html">HDFS Snapshots</a>:
<br>&nbsp;&bull; HDFS Snapshots are read-only point-in-time copies of the file system. 
<br>&nbsp;&bull; Snapshots can be taken on a subtree of the file system, a file, or the entire file system.
<br>&nbsp;&bull; Blocks in datanodes are not copied: snapshot files record the block list and file size. There's no data copying
<br>&nbsp;&bull; Snapshots do not adversely affect regular HDFS operations.
<br>&nbsp;&bull; Incremental snapshots can be taken by doing a diff between two snapshots.
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - hdfs snapshotDiff /path/to/directory_or_file fromSnapshot toSnapshot
<br>
<br>
<br><b>Hive - DR Best Practices & Strategies:</b>
<br>
<br>1.) Use <a href="https://hadoop.apache.org/docs/r2.7.3/hadoop-project-dist/hadoop-hdfs/HdfsSnapshots.html">HDFS Snapshots</a> (since Hive is stored in HDFS)
<br>&nbsp;&bull; Hive data is stored in HDFS, so your HDFS DR strategy could be used for Hive as well. 
<br>&nbsp;&bull; Use snapshot feature in HDFS to take a point in time image. 
<br>Syntax: hdfs snapshotDiff /path/to/directory_or_file snapshot1 snapshot2
<br>
<br>2.) Use <a href="https://hadoop.apache.org/docs/r2.7.3/hadoop-distcp/DistCp.html">Distcp</a> as part of custom pipeline
<br>
<br>3.) Use <a href="http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.5.3/bk_data-movement-and-integration/content/ch_mirroring_on-prem.html">Falcon Data Mirroring</a>
<br>
<br>4.) Use two jobs, one to feed the primary cluster, and another to feed the DR cluster. (i.e. 2 Sqoop jobs)
<br>
<br>
<br><b>References:</b>
<br><a href="http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.5.3/bk_data-movement-and-integration/content/ch_disaster_recovery_falcon.html">Hortonworks HDP 2.5.3 - Configuring for Disaster Recovery</a>
<br><a href="http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.5.3/bk_data-movement-and-integration/content/ch_mirroring_on-prem.html">Hortonworks HDP 2.5.3 - Mirroring Data with Apache Falcon</a>
<br><a href="https://community.hortonworks.com/articles/71775/managing-hadoop-dr-with-distcp-and-snapshots.html">Article - Managing Hadoop DR with Distcp and Snapshots</a>
<br><a href="https://community.hortonworks.com/questions/394/what-are-best-practices-for-setting-up-backup-and.html">Article - Best practices for setting up Backup and Disaster Recovery for Hive in production</a>
<br><a href="https://community.hortonworks.com/articles/55382/hive-disaster-recovery-using-falcon.html">Article - Hive Disaster Recovery using Falcon</a>
<br><a href="https://community.hortonworks.com/articles/63379/hdfs-snapshots-based-replication-using-apache-falc.html">Article - HDFS Snapshot Replication using Falcon</a>
<br><a href="https://community.hortonworks.com/questions/35539/snapshots-backup-and-dr.html">Article - Snapshots Backup and DR</a>
<br><a href="http://hortonworks.com/hadoop-tutorial/incremental-backup-data-hdp-azure-disaster-recovery-burst-capacity/">Tutorial - Incremental Backup to Azure DR Burst Capacity</a>
