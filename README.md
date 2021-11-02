# SqlIncrementalRelease

A very simple sql incremental release builder. Powered by Python.

How it works. 

1. Compares two branches
1. Concatenates any changed files into a set of 3 files 
* output/[db_name]/01_structure.sql
* output/[db_name]/02_logic.sql
* output/[db_name]/03_post_deployment.sql
 3. It also provides a summary of sources in the manifest folder. 
 
*** 
##how to use 
### changes
place your DDL changes in _structure directory. 

This mechanism is best suited for forward only DDL changes. 
Making changes to _structure directory after they are deployed will result in a rebuild of the entire changed file. 
This may be acceptable to you but generally this would be messy.


Any changes to outside of _structure directory will be placed into the 02_logic.sql file
except any changes to post_deployment.sql those will be placed into the 03_post_deployment.sql file

###Build & Deploy Project 
1. run build_deployment.py
1. review Data/SqlServerGorder/manifest
1. deploy Data/SqlServerGorder/output/*
1. Merge Branch