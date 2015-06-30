action :create do
  machine new_resource.name do
    recipe 'yacs::_chef_server_core'
    machine_options new_resource.machine_options
  end
end

action :destroy do
  machine new_resource.name do
    action :destroy
    machine_options new_resource.machine_options
  end
end
