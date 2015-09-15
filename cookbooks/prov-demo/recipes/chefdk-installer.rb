with_driver 'aws::us-west-2'

execute 'chefdk' do
  command 'curl -LO https://www.chef.io/chef/install.sh && sudo bash ./install.sh -P chefdk -p && rm install.sh'
end
