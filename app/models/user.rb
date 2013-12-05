class User < ActiveRecord::Base
  
  rolify
  
  include Authority::UserAbilities
  include Authority::Abilities
  # self.authorizer_name = 'UserAuthorizer'

  has_many :movies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :trackable, :validatable

  def admin
    self.has_role? :admin
  end
  alias_method :admin?, :admin

  def admin= value
    if value == "1"
      self.add_role :admin
    else
      self.remove_role :admin
    end
  end

end