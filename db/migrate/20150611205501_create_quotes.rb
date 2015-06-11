class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.binary :season
      t.binary :episode
      t.string :character
      t.string :description

      t.timestamps
    end
  end
end
