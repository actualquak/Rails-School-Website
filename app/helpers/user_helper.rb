module UserHelper
  def get_user(user:)
    @user = User.find(user)
  end
end
