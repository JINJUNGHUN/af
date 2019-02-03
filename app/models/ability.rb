class Ability
  include CanCan::Ability

  def initialize(user)
    #user -> current_user
       user ||= User.new # guest user (not logged in)
       # 어드민 권한
       if user.has_role? :admin
         can :manage, :all #create, edit 등
       # 일반 유저 권한
       else

       #일반 회원 권한 : 허용
       can [:index, :show, :new, :create, :hashtags], Post
       can [:edit, :update, :destroy], Post, user_id: user.id
       can :destroy, Comment, user_id: user.id

       end
    # Define abilities for the passed in user here. For example:
    #
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
