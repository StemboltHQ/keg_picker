class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, Ballot
      can :read, Beer
      can :create, Ballot
      can [:update, :destroy], Ballot, user: { id: user.id }
    end
  end
end
