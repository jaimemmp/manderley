class Person < ActiveRecord::Base
    belongs_to :movie
    has_many :casts, dependent: :destroy
    has_many :movies, through: :casts
    has_many :directed_movies, lambda { Cast.where(role: "Director") }, through: :casts, :source => :movie
end