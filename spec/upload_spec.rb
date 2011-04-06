require "spec_helper"
require "rspec"
require "json"
require "rails"
require "workout"

describe  "Uploads" do

  it "load json should work" do
    file_path = File.join(Rails.root, "spec/sample_1.json")
    json_obj = JSON.parse(open(file_path).readlines.to_s)
    json_obj.should
  end


  it "should have 3 workouts" do
    file_path = File.join(Rails.root, "spec/3_workouts.json")
    json_obj = JSON.parse(open(file_path).readlines.to_s)
    json_obj['workouts'].size == 3
    workouts = []
    json_obj['workouts'].each do |workout_json|
      workout = Workout.new(workout_json)
      workout.workout_definition_id.should == workout_json['workout_definition_id']
      workouts << workout
    end



  end

end