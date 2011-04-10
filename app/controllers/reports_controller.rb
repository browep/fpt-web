require 'fpt'

class ReportsController < ApplicationController
  def upload
    
  end

  def do_graphs
    db = SQLite3::Database.new( File.join(Rails.root, "spec/data/main_db_1.sqlite"))
    fpt_db = Fpt::Db.new(:db=>db)
    json_file_path = File.join(Rails.root, "spec/data/models.json")
    json_str = open(json_file_path).readlines.to_s
    fpt_model = Fpt::Model.new(json_str)

    fpt_graph = Fpt::Graph.new(fpt_model,fpt_db)
    fpt_table = Fpt::Table.new(fpt_model,fpt_db)

    @graph_urls = {}
    fpt_db.definitions.each do |definition|
      @graph_urls[definition.data['workout_name']]  = {:graph_url=>fpt_graph.graph_workout(definition),
                                                       :table_array=>fpt_table.to_a(definition)}
    end


  end
end
