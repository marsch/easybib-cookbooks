include_recipe "easybib::role-phpapp"

include_recipe "php-pear"
include_recipe "php-gearman"

include_recipe "unfuddle-ssl-fix::install"
include_recipe "deploy::research"

if is_aws
  include_recipe "nginx-app::configure"
else
  include_recipe "memcache"
  include_recipe "nginx-app::vagrant"
end
