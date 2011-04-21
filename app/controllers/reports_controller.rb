require 'fpt'

class ReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def image
    response = IMGUR_API.upload_file(params[:myFile].tempfile.path)
    render :text => response['original_image']
    LOGGLIER.info("IMGUR UPLOAD: #{response['original_image']}" )

  end


  def do_graphs

    
    db = SQLite3::Database.new( File.join(Rails.root, "spec/data/uploaded_2.db"))
    json_file_path = File.join(Rails.root, "spec/data/models.json")
    json_str = open(json_file_path).readlines.to_s

    report_data = report(db, json_str)

    @report_data = report_data

    render 'reports_mailer/report'

    LOGGLIER.info("doing do_graphs")

  end

  def upload

    begin
      db_file = params[:dbFile].tempfile
      model_str = params[:modelJson]
      email = params[:email]
      LOGGLIER.info("REPORT UPLOAD: #{email}")

      File.copy(db_file.path , "/tmp/uploaded_2.db")

      db = SQLite3::Database.new(db_file.path)

      @report_data = report(db, model_str,true)

      ReportsMailer.report(email, @report_data).deliver()

      render :json => {"status"=>"success", "email"=>email}.to_json
    rescue => e
      Rails.logger.error $!
      Rails.logger.error $!.backtrace.join("\n")
      render :json => {"status"=>"failure","message"=>e.to_s}.to_json
    end

  end
end
