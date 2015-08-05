actions :create, :destroy
default_action :create

attribute :name,      kind_of: String, name_attribute: true
attribute :roles,     kind_of: [Array, String], default: 'backend'
attribute :addons,    kind_of: [Array, String], default: ''
attribute :machine_options, kind_of: Hash
attribute :topology,  kind_of: String, default: 'standalone'
