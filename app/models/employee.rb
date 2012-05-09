class Employee < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :position, :position_title, :report_to
  
  #validates :reportto, :uniqueness => true
  #validates :lastname, :presence => true
  #validates :firstname, :presence => true
	
  

  def self.build_from_csv(row)
  	#raise row[1].inspect 
  	@error = nil  	
  	if row[1] == '6'
  		@error = 'Maisa Pride'  		
  	end 	
	
  	cust = Employee.find_or_initialize_by_position(row[0])  	
    cust.attributes ={:position => row[0],
     :report_to => row[1],
     :first_name => row[2],
     :last_name => row[3],
     :position_title => row[4]}
    return cust,@error
  end
  
  def self.EmployeeHeader  	
  	"Position,ReportTo,First Name,Last Name,Position title".split(',')
  end
  
end
