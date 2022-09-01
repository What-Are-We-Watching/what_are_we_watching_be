class Film
  attr_reader :title,
              :moviedb_id,
              :image

  def initialize(data)
    @title = data[:original_title]
    @moviedb_id = data[:id]
    @image = data[:poster_path]

  end
end
