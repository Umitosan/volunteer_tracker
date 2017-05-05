class Project
  attr_accessor(:title, :id)

  def initialize(init_hash)
    @title = init_hash[:title]
    @id = init_hash[:id]
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteer_hashes_arr = []
    returned_volunteers.each() do |tuple|
      name = tuple["name"]
      id = tuple["id"].to_i()
      volunteer_hashes_arr.push(Volunteer.new({:name => name, :id => id}))
    end
    volunteer_hashes_arr
  end

end
