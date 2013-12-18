ActionMailer::Base.smtp_settings ={
	:address					=> "smtp.gmail.com",	
	:port						=> 587,
	:domain						=> "http://open-space.herokuapp.com",
	:user_name					=> "quickrails",
	:password					=> "rubyonrails",
	:authentication				=> "plain",
	:enable_starttls_auto       => true
}

ActionMailer::Base.default_url_options[:host] = "open-space.herokuapp.com"