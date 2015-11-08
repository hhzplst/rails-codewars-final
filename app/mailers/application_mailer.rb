class ApplicationMailer < ActionMailer::Base
  default from: "aiAPP@gmail.com"
  default_url_options[:host]= 'localhost:3000'
end
