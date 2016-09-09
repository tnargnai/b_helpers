module SearchNodes

  def get_nodes_by_role(role, environment=node.chef_environment)
    nodes = search(:node,"chef_environment:#{environment} AND roles:#{role}")
  end

  def get_nodes_hostname_list(nodes, sorted=true)
    hostname_list = []
    nodes.each do |node|
      hostname_list << node['hostname']
    end
    hostname_list.sort! if sorted
    hostname_list
  end

  def get_nodes_ip_list(nodes, sorted=true)
    ip_list = []
    nodes.each do |node|
      ip_list << node['ipaddress']
    end
  end

end

Chef::Recipe.send(:include, SearchNodes)
