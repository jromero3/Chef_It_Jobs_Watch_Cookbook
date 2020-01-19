# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'It_Jobs_Watch_Cookbook'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'It_Jobs_Watch_Cookbook::default'

# Specify a custom source for a single cookbook:
cookbook 'It_Jobs_Watch_Cookbook', path: '.'
