class Movie < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :casts, dependent: :destroy
  has_many :people, through: :casts
  has_many :directors, lambda { Person.where(role: "Director") }, through: :casts, :source => :person
  #has_many :actors, lambda { Person.where(role: "Actor") }, through: :casts, :source => :person
  #has_many :producers, lambda { Person.where(role: "Producer") }, through: :casts, :source => :person
  # Cast::ROLE.each do |role|
  #    has_many role.pluralize.to_sym, lambda { Person.where(role: role) }, through: :casts, :source => :person
  # end
  belongs_to  :user

  scope :directed_by, lambda { |person| joins(:casts).where(casts: {role: 'Director', person: person}) }
  scope :lower_than, lambda { |field, value| where("#{field} < ?", value) }
  scope :higher_than, lambda { |field, value| where("#{field} > ?", value) }
  scope :between, lambda { |field, min, max| where("#{field} < ?", max).where("#{field} > ?", min) }

  serialize :categories

  def reject_categories
      self.categories = self.categories.find_all{ |x| x.present? }
  end

  before_save :reject_categories

  CATEGORIES = ["Action", "Heroes", "War", "Drama", "Romance", "Horror"]

  def release_date=(date)
    case date
      when Hash then release_date = Date.new(date[:year],date[:month],date[:day])
      when Date then release_date = {:year => date.year, :month => date.month, :day => date.day}
    end 
  end

  extend FriendlyId
  friendly_id :generate_slug, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def generate_slug
    [
      :title,
      [:title, :year]
    ]
  end

  # def to_key
  #   [slug]
  # end

  mount_uploader :photo, PhotoUploader

end