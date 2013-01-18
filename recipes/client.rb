#
# Cookbook Name:: 389
# Recipe:: client

package "ldap-utils" do
  action :upgrade
end

directory node['openldap']['ssl_dir'] do
  mode 00755
  owner "root"
  group "root"
end