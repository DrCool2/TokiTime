class AddForeignKeyToTokis < ActiveRecord::Migration[6.0]
  def change
    add_column :tokis, :status_id, :string
  end
end
