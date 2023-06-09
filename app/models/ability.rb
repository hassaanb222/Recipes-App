class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
