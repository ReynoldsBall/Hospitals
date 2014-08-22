module ApplicationHelper
   def is_link_active?(clicked_controller)
    p '*'*100
    p 'Hello'
    p params
    "active" if clicked_controller == params[:controller]
  end

  def to_money(number)
    sprintf("$%0.02f", number)
  end

  def user_login_links
    if user_signed_in?
      content_tag(:span, current_user.full_name, style: "color:red;") +
        (link_to "Edit", edit_user_registration_path) +
        (link_to "Log Out", destroy_user_session_path, method: :delete)
    else
      link_to "Log In", new_user_session_path
    end
  end
end
