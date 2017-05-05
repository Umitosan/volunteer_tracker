class Volunteer
  attr_accessor(:name, :id)

  def initialize(init_hash)
    @name = init_hash['name']
    @id = init_hash['id']
  end

  def self.all 
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteer_hashes_arr = []
    returned_volunteers.each() do |pgtuple|
      name = list["name"]
      id = list["id"].to_i()
      volunteer_hashes_arr.push(Volunteer.new({:name => name, :id => id}))
    end
    volunteer_hashes_arr
  end

  def save
  end

  def update
  end

  def delete
  end

end
