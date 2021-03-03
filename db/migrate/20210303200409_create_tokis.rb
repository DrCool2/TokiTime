class CreateTokis < ActiveRecord::Migration[6.0]
  def change
    create_table :tokis do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.string :note

      t.timestamps
    end
  end
end
