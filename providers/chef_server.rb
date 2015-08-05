action :create do
  machine 'bootstrap' do
    recipe 'yacs::bootstrap'
    attribute 'api_fqdn', 'new_resource.name'
    machine_options new_resource.machine_options
  end
  case new_resource.topology
  when 'ha'
    machine_batch do
      machine 'secondary' do
        recipe 'yacs::secondary'
        machine_options new_resource.machine_options
      end
      1.upto(2) do |i|
        machine "frontend-#{i}" do
          recipe 'yacs::frontend'
          machine_options new_resource.machine_options
        end
      end
    end
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
