# frozen_string_literal: true

# create weathers
class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.text :response_data

      t.timestamps
    end
  end
end
