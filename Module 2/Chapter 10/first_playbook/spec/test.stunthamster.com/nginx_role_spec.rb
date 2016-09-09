require 'spec_helper'
require 'yaml'

describe package('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end

vh_list = YAML.load_file('group_vars/dev/virtualhosts.yml')

vh_list['virtualhosts'].each do |key|
  describe file ("/etc/nginx/sites-enabled/#{key[0]}.conf")do
    it { should be_linked_to "/etc/nginx/sites-available/#{key[0]}.conf"}
  end

end
