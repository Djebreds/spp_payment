module ApplicationHelper
  def parent_nav_is_active?(path)
    rp = request.path
    if rp == path
      'active'
    elsif rp.include? path #child page check
      'active'
    end
  end
end
