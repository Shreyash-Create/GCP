*********
1) Do not delete or make any change in the row for any VM that is already created.It will delete/replace the VM in GCP.
2) VM Name should be all lower case, no spaces in it. example vm-name-dev
3) Client name should be all lower case, no spaces in it. Example: abc-inc
4) To delete any VM, Go to GCP Console, edit the VM to disable delete protection and then remove it from CSV file and run the pipeline.