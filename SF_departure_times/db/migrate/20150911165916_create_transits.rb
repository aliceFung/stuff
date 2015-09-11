class CreateTransits < ActiveRecord::Migration
  def change
    create_table :transits do |t|

      t.timestamps null: false
    end
  end
end
