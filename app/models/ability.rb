# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # can :manage, :all
    # user ||= User.new # guest uer (not logged in)
    if user.present?
        # can :read,User, user_id: user.id
        if user.has_role?(:admin)  # additional permissions for administrators
            can :manage, :all
        end
        if user.has_role?(:manager)  # additional permissions for administrators
            can :update, Page
        end
        if user.has_role?(:user)  # additional permissions for administrators
            can :read, User
        end
        # if user.admin?  # additional permissions for administrators
        #     can :manage, :all
        # end
    end
    #
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end