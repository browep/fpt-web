require "json"
class Report
  attr_reader :models,:definitions,:workouts
  def initialize(json_str)
    json_obj = JSON.parse(json_str)
    # get all the models
    @models = json_obj["models"]

    # get all the definitions
    @definitions = json_obj["definitions"]

    # get all the workouts
    @workouts = json_obj["workouts"]

    

  end
end