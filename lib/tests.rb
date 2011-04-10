require "json"
require "rails"
require "workout"
require "rspec"
require 'sqlite3'
require "fpt"
require "date"

class Tester

  def load_db
    db = SQLite3::Database.new( File.join(Rails.root, "spec/data/main_db_1.sqlite"))
    fpt_db = Fpt::Db.new(:db=>db)
    fpt_db.definitions.size.should == 4
    fpt_db.definition_ids.size.should == 4

    fpt_db.definitions.size.should == 4
    fpt_db.definition_ids.size.should == 4

    fpt_db.definitions.each do |definition|
      entries = fpt_db.workout_entries(definition.id)
      entries.size.should(nil,definition.to_s) > 0

      entries.each do |entry|
        true.should == (entry.modified.instance_of? DateTime)
        true.should == (entry.created.instance_of? DateTime)
      end

      false.should == fpt_db.definition_by_name(definition.data['workout_name']).nil?

    end



    

  end
end
