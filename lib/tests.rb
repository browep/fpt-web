require "json"
require "rails"
require "workout"
require "report"
require "rspec"

class Tester
  def load_models
    file_path = File.join(Rails.root, "spec/data_1.json")
    json_str = open(file_path).readlines.to_s
    report = Report.new(json_str)
    report.models.size.should == 5
    report.d

  end
end
