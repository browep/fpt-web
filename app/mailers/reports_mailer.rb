class ReportsMailer < ActionMailer::Base
  default :from => "simpleworkouttracker@gmail.com"
  def report email
    mail(:to => email,
         :subject => "Your Simple Workout Tracker Report")

  end
end
