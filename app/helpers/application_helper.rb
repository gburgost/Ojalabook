module ApplicationHelper
  def bootstrap_class_for(flash_type)
  case flash_type
  when "alert"
    "alert-danger"   # red
  when "notice"
    "alert-success"      # green
  else
    ""
  end
end
end