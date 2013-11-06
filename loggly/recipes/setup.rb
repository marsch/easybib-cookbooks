gem_package "json"

if node["loggly"] && (node["loggly"]["domain"] != 'example')

  logglydata = node["loggly"]["token"]
  
  if is_aws()
    cluster_name   = get_cluster_name()
    logglydata << " tag=\"#{cluster_name}\""
    Chef::Log.debug("Logglydata is: #{logglydata}")
    
    get_instance_roles().each do |layer|
      logglydata << " tag=\"#{cluster_name}\""
      Chef::Log.debug("Logglydata is: #{logglydata}")
    end
  end

  Chef::Log.debug("Logglydata is: #{logglydata}")
  template "/etc/rsyslog.d/10-loggly.conf" do
    source "10-loggly.conf.erb"
    variables(
      :include_files => logglydata
    )
    mode "0644"
  end

  service "rsyslog" do
    supports :status => true, :restart => true, :reload => true
    action [ :restart ]
  end


  include_recipe "loggly::opsworks"

end
