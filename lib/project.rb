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

end
