class Ability

  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user.present?

    can :create, [Comment, Post]
    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Comment, author: user
      can :destroy, Post, author: user
      can :delete, Post, author: user
    end
  end
end
