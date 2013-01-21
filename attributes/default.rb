# Cookbook Name:: 389
# Attributes:: 389
#


default['389']['basedn'] = "dc=example,dc=com"
default['389']['server'] = "ldap.example.com"
default['389']['domain'] = node['domain']

if node['fqdn'].length > 0
  default['389']['server'] = node['fqdn']
end

if node['domain'].length > 0
  default['389']['basedn'] = "dc=#{node['domain'].split('.').join(",dc=")}"
  default['389']['server'] = "ldap.#{node['domain']}"
end

default['389']['port'] = '389'
default['389']['rootdn'] = "cn=admin"
default['389']['rootpw'] = '{SSHA}gqx00u6a46YT0zsIC9nQVy2yyHfNjJmO' #nil


default['389']['ServerAdminID'] = 'admin'
default['389']['ServerAdminPwd'] = 'admin'
default['389']['admin_port'] = '9830'


default['389']['ConfigDirectoryAdminID'] = 'admin'
default['389']['ConfigDirectoryAdminPwd'] = 'admin'
default['389']['SuiteSpotUserID'] = 'nobody'
default['389']['SuiteSpotGroup'] = 'nobody'

