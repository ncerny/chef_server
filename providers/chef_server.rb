action :create do
  # machine 'bootstrap' do
  #   recipe 'yacs::bootstrap'
  #   attribute 'api_fqdn', new_resource.name
  #   machine_options new_resource.machine_options
  # end
  case new_resource.topology
  when 'ha'
    machine_batch do
      1.upto(4) do |i|
        machine "chef-server-#{i}" do
          recipe 'yacs::chef_server_core'
          machine_options new_resource.machine_options
        end
      end
    end

    # pick one as bootstrap
    # form the chef-server.rb
    # drop the chef-server.rb on bootstrap
    # reconfigure bootstrap

    # set up drbd with machine execute

    # copy /etc/opscode to other nodes
    # reonfigure other nodes
  end
end

action :destroy do
  case new_resource.topology
  when 'standalone'
    machine new_resource.name do
      action :destroy
      machine_options new_resource.machine_options
    end
  end
end

bootstrap.ipaddress