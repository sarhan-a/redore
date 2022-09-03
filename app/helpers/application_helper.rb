module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      gravatar_image_url(user.email)
    end
  end
end
