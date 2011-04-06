class Workout
  attr_reader :workout_definition_id

  def initialize( params, types={})
    @workout_definition_id = params['workout_definition_id']
  end

  def name
    @name
  end
end