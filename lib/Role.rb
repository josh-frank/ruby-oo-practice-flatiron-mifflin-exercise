# **`Role`**
# * Role is initialized with a name, which won't ever change.
# * `Role#name`
#   * returns a `String` that is the role's name
# * `Role#employees`
#   * returns an array of all the Employees who work at that role
# * `Role#managers`
#   * returns a unique array of all the Manager instances who oversee Employees at that role 
# * `Role.all`
#   * returns an `Array` of all the roles
# * `Role#add_employee`
#   * takes a `String` argument of an employee's name, a `Fixnum` argument of the employee's salary and an instance of a Manager class and creates a new employee who work at this role

class Role

    @@all = []

    # * `Role#name`
    #   * returns a `String` that is the role's name
    # * `Role#employees`
    #   * returns an array of all the Employees who work at that role
    # * `Role#managers`
    #   * returns a unique array of all the Manager instances who oversee Employees at that role 
    attr_reader :name
    attr_accessor :managers, :employees

    # * Role is initialized with a name, which won't ever change.
    def initialize( this_name )
        @name = this_name
        @managers = []
        @employees = []
        @@all << self
    end

    # * `Role.all`
    #   * returns an `Array` of all the roles
    def self.all
        @@all
    end

    # * `Role#add_employee`
    #   * takes a `String` argument of an employee's name, a `Fixnum` argument of the employee's salary and an instance of a Manager class and creates a new employee who work at this role
    def add_employee( employee_name, employee_salary, manager )
        self.employees << Employee.new( employee_name, employee_salary )
        self.managers << manager if !self.managers.include?( manager )
    end

end