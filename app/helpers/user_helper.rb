module UserHelper
  def get_user(user:)
    @user = User.find(user)
  end
  def get_user_name(id:)
    User.find(id).name
  end
end
