module ApplicationHelper
 def active_class(link_path)
  current_page?(link_path) ? "active" : ""
 end
 def flash_message
   messages = ""
   [:notice, :info, :warning, :error].each do|type|
     if flash[type]
       messages += "<p class=\"#{type}\">#{flash[type]}</p>"
     end
   end
   messages
  end
end
