module ApplicationHelper

	def full_title(page_title)
    	base_title = "Wed-e"
    	if page_title.empty?
      		base_title
    	else
      		"#{base_title} | #{page_title}"
    	end
  	end

  	def gavatar_url(email)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

end
