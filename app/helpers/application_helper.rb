module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      cl_image_path user.avatar.key, crop: :fill, gravity: :face, width: 250, height: 250
    else
      gravatar_image_url(user.email)
    end
  end
end
