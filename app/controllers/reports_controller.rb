require 'fpt'

class ReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def image
    response = IMGUR_API.upload_file(params[:myFile].tempfile.path)
    render :text => response['original_image']
    LOGGLIER.info("IMGUR UPLOAD: #{response['original_image']}" )

  end


  def do_graphs

    
    db = SQLite3::Database.new( File.join(Rails.root, "spec/data/main_db_1.sqlite"))
    json_file_path = File.join(Rails.root, "spec/data/models.json")
    json_str = open(json_file_path).readlines.to_s

    report_data = report(db, json_str)

    @report_data = report_data

    render 'reports_mailer/report'

    LOGGLIER.info("doing do_graphs")


  end
end
