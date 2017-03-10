class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    if user.has_role? :Admin
      can :access, :rails_admin  # only allow admin users to access Rails Admin
      can :dashboard             # allow access to dashboard
      can [:read, :create, :update], Parking
      can [:read, :create], User
      can [:read, :create, :edit], Fee
      can [:read, :create], FeeType
      can [:read], FeeTime
      can [:read], Role
      can [:read,:create,:edit], VehicleType
      can [:read,:create,:edit], Place

    elsif user.has_role? :ParkingAttendant
      can [:read], User
      can [:read, :create], Fee
      can [:read], Parking
      can [:read], Place

    elsif user.has_role? :MasterAdmin
      can :access, :rails_admin  # only allow admin users to access Rails Admin
      can :dashboard             # allow access to dashboard
      can [:manage], :all
    end

    #   user ||= User.new # guest user (not logged in)
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
