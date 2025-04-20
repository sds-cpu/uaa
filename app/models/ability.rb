class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Define abilities based on user roles and permissions
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :update, User, id: user.id
    end
  end
end
