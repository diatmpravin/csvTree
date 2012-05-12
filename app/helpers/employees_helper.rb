module EmployeesHelper

	#def display_comments(tree)
  #  to_render = ""
  #  to_render << render({:partial => 'comment', :locals => {:body => tree.first_name}})
  #  @childs = Employee.where(:report_to => tree.position)
    #raise @childs.inspect
  #  @childs.each do |child|
  #     to_render << display_comments(child)
  #  end
  #  return to_render.html_safe
  #end
  
  def display_categories(categories)
   	ret = "<ul>"
    for category in categories
      if category.report_to == 0
	      ret += "<li>"
	      ret += "<input type='checkbox'>"
	      ret += category.first_name
	      ret += " "
	      ret += category.last_name 
	      ret += "("
	      ret += category.position_title 
	      ret += ")"
	      ret += find_all_subcategories(category)
	      ret += "</li>"
      end
    end
    ret += "</ul>"
    return ret.html_safe
  end
  
  def find_all_subcategories(category)
    @childs = Employee.where(:report_to => category.position)
    if @childs.size > 0
      ret = '<ul>'
      @childs.each { |subcat|       
        @childs1 = Employee.where(:report_to => subcat.position)
        if @childs1.size > 0
          ret += '<li>'
          ret += "<input type='checkbox'>"
          ret += subcat.first_name
          ret += " "
          ret += subcat.last_name 
	        ret += "("
	        ret += subcat.position_title
          ret += ")"
          ret += find_all_subcategories(subcat)
          ret += '</li>'
        else
          ret += '<li>'          
          ret += "<input type='checkbox'>"
          ret += subcat.first_name
          ret += " "
          ret += subcat.last_name
          ret += "(" 
	        ret += subcat.position_title 
          ret += ")"
          ret += '</li>'
        end
        }
      ret += '</ul>'
    end
  end



end
