class Volunteer
  attr_accessor(:name, :id)

  def initialize(init_hash)
    @name = init_hash[:name]
    @id = init_hash[:id]
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteer_hashes_arr = []
    returned_volunteers.each() do |tuple|
      name = tuple['name']
      id = tuple['id'].to_i()
      volunteer_hashes_arr.push(Volunteer.new({:name => name, :id => id}))
    end
    volunteer_hashes_arr
  end

  def save
    pg_result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = pg_result[0]['id'].to_i()
  end

  def update(attr_hash)
    @name = attr_hash[:name]
    @id = self.id
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
  end

  def add_project(project_id)
    @id = self.id
    DB.exec("UPDATE volunteers SET project_id = '#{project_id}' WHERE id = #{@id};")
  end

  def self.find_by_id(id)
    found_volunteer = nil
    Volunteer.all.each do |vol|
      if vol.id = id
        found_volunteer = vol
      end
    end
    found_volunteer
  end

end
