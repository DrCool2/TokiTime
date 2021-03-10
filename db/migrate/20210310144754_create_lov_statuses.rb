class CreateLovStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :lov_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
