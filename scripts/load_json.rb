require 'json'
require 'pry'
 
 
def create_movie_from_json json
  Movie.create title: json["Title"], duration: json["Runtime"], year: json["Year"], synopsis: json["Plot"]
end
 
def load_movies_from_file(file)
    File.foreach(file) do |l|
    unless l.blank?
      json = JSON.parse(l)
      create_movie_from_json(json)
    end
  end
end
 
def load_default_file
  current_dir = File.dirname(__FILE__)
  file = File.join(current_dir, 'jw.json')
  load_movies_from_file file
end