module ApplicationHelper
  include Pagy::Frontend

  def can_update_status?
    current_user.role == "moderator"
  end

  def can_view_configurations?
    current_user.role == "moderator"
  end
end
