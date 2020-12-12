# **`Manager`**
#   * Manager is initialized with a name, department and age. All of these attributes can change.
#   * `Manager#name`
#     * returns a `String` that is the manager's name
#   * `Manager#department`
#     * returns a `String` that is the department that the manager oversees
#   * `Manager#age`
#     * returns a `Fixnum` that is the age of the manager
#   * `Manager#employees`
#     * returns an `Array` of all the employees that the manager oversees
#   * `Manager#roles`
#     * returns an `Array` of all the roles that the manager oversees
#   * `Manager.all`
#     * returns an `Array` of all the managers
#   * `Manager.all_departments`
#     * returns an `Array` of all the department names that every manager oversees without repetitions
#   * `Manager.average_age`
#     * returns a `Float` that is the average age of all the managers


class Manager

    @@all = []

    #   * `Manager#name`
    #     * returns a `String` that is the manager's name
    #   * `Manager#department`
    #     * returns a `String` that is the department that the manager oversees
    #   * `Manager#age`
    #     * returns a `Fixnum` that is the age of the manager
    attr_accessor :name, :department, :age

    #   * Manager is initialized with a name, department and age. All of these attributes can change.
    def initialize( this_name, this_department, this_age )
        @name = this_name
        @department = this_department
        @age = this_age
        @@all << self
    end

    #   * `Manager.all`
    #     * returns an `Array` of all the managers
    def self.all
        @@all
    end

    #   * `Manager#employees`
    #     * returns an `Array` of all the employees that the manager oversees
    def employees
        Employee.all.select{ | employee | employee.manager_name == self.name }
    end

    #   * `Manager#roles`
    #     * returns an `Array` of all the roles that the manager oversees
    def roles
        Role.all.select{ | role | role.name == self.department.name }
    end

    #   * `Manager.all_departments`
    #     * returns an `Array` of all the department names that every manager oversees without repetitions
    def self.all_departments
        Role.all.map{ | role | role.name }
    end
    
    #   * `Manager.average_age`
    #     * returns a `Float` that is the average age of all the managers
    def self.average_age
        all_ages = Manager.all.map{ | manager | manager.age }
        all_ages.sum / all_ages.size
    end

end