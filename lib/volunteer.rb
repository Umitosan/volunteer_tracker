class Volunteer
  attr_accessor(:name, :id)

  def initialize(init_hash)
    @name = init_hash['name']
    @id = init_hash['id']
  end

  def self.all
  end

  def save
  end

  def update
  end

  def delete
  end

end
