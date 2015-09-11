class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string      :tag,   null: false
      t.string      :title, null: false
      t.references  :route

      t.timestamps null: false
    end
    add_index :directions, :route_id
  end
end
