class CleanupTokiStatus < ActiveRecord::Migration[6.0]
  def change
    #ActiveRecord::Schema.define(version: 2021_03_10_201404) do

      create_table "statuses", force: :cascade do |t|
        t.string "status"
        t.datetime "created_at", precision: 6, null: false
        t.datetime "updated_at", precision: 6, null: false
      end

      create_table "tokis", force: :cascade do |t|
        t.datetime "clock_in"
        t.datetime "clock_out"
        t.string "note"
        t.datetime "created_at", precision: 6, null: false
        t.datetime "updated_at", precision: 6, null: false
      end

  end
end
