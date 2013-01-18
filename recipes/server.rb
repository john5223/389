#
# Cookbook Name:: 389
# Recipe:: server
#



if platform?("redhat", "fedora")
    
  package "389-ds" do
    action [:install]
  end
  
  
  directory '/etc/389' do
    owner "root"
    mode "0755"
    action :create
  end

  template "/etc/389/setup.inf" do
    source "setup.inf.erb"
  end


end


