#
# Cookbook Name:: 389
# Recipe:: server
#



if platform?("redhat", "fedora")
    
  package "389-ds" do
    action :upgrade
  end
  
  directory '/etc/389' do
    owner "root"
    mode "0755"
    action :create
  end


  execute "setup-ds-admin.pl" do
    command "setup-ds-admin.pl -s -f /etc/389/setup.inf"
    user "root"
    action :nothing
    #notifies :start, resources(:service => "slapd"), :immediately
  end

  template "/etc/389/setup.inf" do
    source "setup.inf.erb"
    mode 00640
    #notifies :stop, resources(:service => "slapd"), :immediately
    notifies :run, resources(:execute => "setup-ds-admin.pl")
  end



end


