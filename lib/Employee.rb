class Employee

    @@all = []

    #   * `Employee#name`
    #     * returns a `String` that is the employee's name
    #   * `Employee#salary`
    #     * returns a `Fixnum` that is the employee's salary
    attr_accessor :name, :salary

    #   * Employee is initialized with a name and salary. All of these attributes can change.
    def initialize( this_name, this_salary )
        @name = this_name
        @salary = this_salary
        @@all << self
    end

    #   * `Employee.all`
    #     * returns an `Array` of all the employees
    def self.all
        @@all
    end

    #   * `Employee#manager_name`
    #     * returns a `String` that is the name of their manager
    def manager_name
        Role.all.find{ | role | role.employees.include?( self ) }.managers.first.name
    end

    #   * `Employee.paid_over`
    #     * takes a `Fixnum` argument and returns an `Array` of all the employees whose salaries are over that amount
    def self.paid_over( amount )
        Employee.all.select{ | employee | employee.salary > amount }
        # Employee.all.reject{ | employee | employee.salary <= amount }
    end

    #   * `Employee.find_by_department`
    #     * takes a `String` argument that is the name of a department and returns the first employee whose manager is working in that department
    def self.find_by_department( department_name )
        Role.all.find{ | role | role.name == department_name }.employees.first
    end
    
    #   * `Employee#tax_bracket`
    #     * returns an `Array` of all the employees whose salaries are within $1000 (± 1000) of the employee who invoked the method
    def tax_bracket
        Employee.all.select{ | employee | employee.salary.between?( self.salary - 1000, self.salary + 1000 ) && employee != self }
        # Employee.all.select{ | employee | employee.salary < self.salary + 1000 && employee.salary > self.salary - 1000 && employee != self }
    end

    #   * `Employee.search_by_role`
    #     * takes a `String` argument that is the name of a role and returns all the employees who work at that role
    def self.search_by_role( this_role_name )
        Role.all.find{ | role | role.name == this_role_name }.employees
    end

    #   * `Employee#get_promoted`
    #     * takes an argument of an instance of a Role, updates Employee's role and increases Employee's salary.
    def get_promoted( promoted_to )
        current_role = Role.all.find{ | role | role.employees.include?( self ) }
        current_role.employees.delete( self )
        promoted_to.employees << self
        self.salary += 1000
    end
    
end