ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
    :access_key_id     => ENV['aws_id'],
    :secret_access_key => ENV['aws_secret']