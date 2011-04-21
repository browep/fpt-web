namespace :integration do
  task :send_aws_email => :environment do
    db = SQLite3::Database.new(File.join(Rails.root, "spec/data/uploaded_1.db"))
    json_file_path = File.join(Rails.root, "spec/data/models.json")
    json_str = open(json_file_path).readlines.to_s

    report_data = report(db, json_str,true)

    ReportsMailer.report('ileftmykeys@gmail.com',report_data).deliver()
    ReportsMailer.report('brower.paul@gmail.com',report_data).deliver()
  end

end