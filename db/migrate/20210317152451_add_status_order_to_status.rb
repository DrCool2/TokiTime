class AddStatusOrderToStatus < ActiveRecord::Migration[6.0]
  def change
    add_column :statuses, :status_order, :integer
  end
end
