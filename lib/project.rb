class Project
  attr_accessor(:title, :id)

  def initialize(init_hash)
    @title = init_hash[:title]
    @id = init_hash[:id]
  end

  def save
  end

  def all
  end

  def update
  end

  def delete
  end

  def add_volunteer
  end

end
