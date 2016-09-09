require 'yaml'
thing = YAML.load_file('../../group_vars/dev/virtualhosts.yml')


thing['virtualhosts'].each do |key, value|
  puts value['server_name']
end