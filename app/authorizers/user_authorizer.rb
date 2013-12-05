class UserAuthorizer < ApplicationAuthorizer
  # Class method: can this user at least sometimes edit a User?
  # def self.editable_by?(user)
  #   user == resource || user.admin?
  # end

  def self.updateable_by?(user)
    user == resource || user.admin?
  end

  # def self.profileable_by?(user)
  #   user == resource || user.admin?
  # end
  
  # def self.showable_by?(user)
  #   user == resource || user.admin?
  # end

  # Instance method: can this user delete this particular user?
  # def deletable_by?(user)
  #   resource.in_future? && user.manager? && resource.department == user.department
  # end
end

# undefined; calls `ScheduleAuthorizer.default(:updatable, user)`
# UserAuthorizer.updatable_by?(user)