class Project
  attr_accessor(:title, :id)

  def initialize(init_hash)
    @title = init_hash[:title]
    @id = init_hash[:id]
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects_hashes_arr = []
    returned_projects.each() do |tuple|
      title = tuple["title"]
      id = tuple["id"].to_i()
      projects_hashes_arr.push(Project.new({:title => title, :id => id}))
    end
    projects_hashes_arr
  end

  def save
    pg_result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = pg_result[0]["id"].to_i()
  end

  def update(attr_hash)
    @title = attr_hash[:title]
    @id = self.id
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  end

  def self.find_by_id(id)
    found_project = nil
    Project.all.each do |proj|
      if proj.id = id
        found_project = proj
      end
    end
    found_project
  end

  def get_vols_on_proj
    found_vols = nil
    @id = self.id
    pg_results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
    pg_results.each do |tuple|
      vol_id = tuple[0]['project_id'].to_i
      vol = Volunteers.find_by_id(vol_id)
      found_vols.push(vol)
    end
    found_vols
  end

end
