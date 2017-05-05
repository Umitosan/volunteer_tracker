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
      name = tuple["title"]
      id = tuple["id"].to_i()
      vprojects_hashes_arr.push(Project.new({:name => title, :id => id}))
    end
    projects_hashes_arr
  end

end
