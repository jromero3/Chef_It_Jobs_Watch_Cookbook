# It_Jobs_Watch_Cookbook

## Chef Cookbook

I began by writing the cookbook that would be used to provision the python app.\
In my recipe file, I wrote in that my machine should:
1) Update all sources
2) Install pip through python3
3) Install the required modules using pip by running the requierements.txt file
4) Create a Downloads directory
5) Create an ItJobsWatchTop30.csv file

I also made sure to create a spec test file prior to this, in order to make\
sure I could run a unit test to check that I had everything I wanted to be\
provisioned. After I ran the unit test and made sure all tests passed, I began\
creating the integration test, checking that:

1) Pip was installed
2) The Downloads folder was created
3) The ItJobsWatchTop30.csv file was created

Once I created the file, I ran the command "kitchen verify", which would run\
the integration test. After some minor changes, the test passed and my cookbook\
was ready.

## Jenkins Pipelines

As of right now, I wasn't able to create the jobs required to have the\
Developer and DevOps pipelines up and running. This was due to the Jenkins\
server being down. However, what I would've done is firstly created the DevOps\
pipeline. I would have a webhook put on the GitHub repository for my cookbook,\
so when a push is made on GitHub, the webhook would trigger and start a Jenkins\
job.

The first job would run the unit test on the cookbook. If it passes, it would\
trigger another job which would then run the integration test. Finally if that\
also passes, a final job would be triggered, which would merge the pushed\
contents to the master branch.

Then for the Developer pipeline, a webhook would also be placed on the app\
repository. Once it triggers, it would run a job on Jenkins that would use the\
slave node with the Python environment in order to test the app would work.\
If the app works correctly and the job succeeds, it triggers another job that\
will merge the data to the master branch. Then the same webhook will trigger\
again from the merge, causing the packer file to create an AMI and put it on\
AWS.
