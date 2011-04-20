class ReportsMailer < ActionMailer::Base
  default :from => "simpleworkouttracker@gmail.com"
  helper :application

  def report email,report_data
    @report_data = report_data
    mail(:to => email,
         :subject => "Your Simple Workout Tracker Report")

  end
end
