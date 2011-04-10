
namespace :integration do
  task :send_aws_email => :environment do
      Rails.logger.info("sending email")
      ReportsMailer.report('ileftmykeys@gmail.com').deliver()
  end

end