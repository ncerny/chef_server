action :create do
  machine new_resource.name do
    recipe 'chef_server::_chef_server_core'
  end
end

action :destroy do
  machine new_resource.name do
    action :destroy
  end
end
