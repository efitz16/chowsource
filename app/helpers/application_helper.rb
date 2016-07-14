module ApplicationHelper
  def creator?(current_user, recipe)
    logged_in? && current_user == recipe.user
  end
end
