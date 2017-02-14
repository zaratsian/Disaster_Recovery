<h3>Hadoop Cluster - Disaster_Recovery</h3>
Resources, tricks, and recommendations for DR (Disaster Recovery) Hadoop clusters
<br>
<br><b>HDFS - DR Best Practices & Strategies:</b>
<br>
<br>
<br><b>Hive - DR Best Practices & Strategies:</b>
<br>
<br>Option #1: Use HDFS Snapshots (since Hive is stored in HDFS)
<br>Hive data gets stored in HDFS (Hadoop Distributed File System), so any backup or DR (Disaster Recovery) strategy you have for HDFS could be used for Hive as well. So, you can use snapshot feature in HDFS to take a point in time image. These snapshot could be for entire file system, a sub-tree in a file system or just a file. You can also take incremental snapshot by doing a diff between two snapshots.
<br>
<br>Option #2: Use <a href="https://hadoop.apache.org/docs/r2.7.3/hadoop-distcp/DistCp.html">Distcp</a> as part of custom pipeline
<br>
<br>Option #3: Use <a href="http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.5.3/bk_data-movement-and-integration/content/ch_mirroring_on-prem.html">Falcon Data Mirroring</a>
<br>
<br>Option #4: Use two jobs, one to feed the primary cluster, and another to feed the DR cluster. (i.e. 2 Sqoop jobs)
<br>
<br>
<br><b>References:</b>
<br><a href="http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.5.3/bk_data-movement-and-integration/content/ch_disaster_recovery_falcon.html">Hortonworks HDP 2.5.3 - Configuring for Disaster Recovery</a>
<br><a href="http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.5.3/bk_data-movement-and-integration/content/ch_mirroring_on-prem.html">Hortonworks HDP 2.5.3 - Mirroring Data with Apache Falcon</a>
<br><a href="https://community.hortonworks.com/articles/71775/managing-hadoop-dr-with-distcp-and-snapshots.html">Article - Managing Hadoop DR with Distcp and Snapshots</a>
<br><a href="https://community.hortonworks.com/questions/394/what-are-best-practices-for-setting-up-backup-and.html">Article - Best practices for setting up Backup and Disaster Recovery for Hive in production</a>
