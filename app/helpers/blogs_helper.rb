module BlogsHelper
  def blog_owner?(id, current_id)
    id == current_id
  end
end
