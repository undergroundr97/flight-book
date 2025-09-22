class CreateAirport < ActiveRecord::Migration[8.0]
  def change
    create_table :airports do |t|
      t.string :code

      t.timestamps
    end
  end
end
