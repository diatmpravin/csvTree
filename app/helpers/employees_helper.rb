module EmployeesHelper

	def display_segment(node)
		@childs	= Employee.where(:report_to => node.position) 			
		html = "<li>"
    node_class = @childs.length == 0 ? "file" : "folder"
    html << "<span class=\"#{node_class}\">#{h(node.first_name)} </span>"
    html << "<ul id=\"children_of_#{h(node.report_to)}\">"
    @childs.each{|child_node|
      
      html << display_segment( child_node )
    }
    html << "</ul></li>"
  end

end
