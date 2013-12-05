class Cast < ActiveRecord::Base
  belongs_to :movie
  belongs_to :person

  ROLE = ["Director", "Actor", "Producer"]
end
