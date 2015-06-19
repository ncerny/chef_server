current_dir       = File.dirname(__FILE__)
chef_repo_path    "#{current_dir}/.."
file_cache_path   File.join(current_dir, 'local-mode-cache', 'cache')
cookbook_path [
  "#{current_dir}/../cookbooks",
  "#{current_dir}/../berks-cookbooks"
]
chef_zero.port 8890
