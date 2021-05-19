class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # CanCanCan espera un "current_user", aunque no necesitamos setearlo, ya
    # que el gema DEVISE nos lo brinda
    user ||= User.new # guest user (not logged in

    if user.id == 1
      can :manage, :all
    end

    if user.admin?
      can :manage, Product
      can :manage, Brand

      # can :manage, Category
      can [:index, :create, :update, :show], Category
      # cannot :destroy, Category
      can :index, :administrator
      # can :toggle_admin, :administrator
    else
      can :show, Product
      can :store, Product
      can :create, User
      can :read, User, :id => user.id
      can :update, User, :id => user.id
    end

  end
end
