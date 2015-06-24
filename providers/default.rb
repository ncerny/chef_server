action :create do
  machine new_resource.name do
    recipe 'chef_server::_chef_server_core'
    attributes  'chef_server' => { 'topology' => new_resource.topology } 
    machine_options new_resource.machine_options
  end
end

action :destroy do
  machine new_resource.name do
    action :destroy
    machine_options new_resource.machine_options
  end
end
