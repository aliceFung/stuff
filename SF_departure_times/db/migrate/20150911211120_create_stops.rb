class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.references  :route,      null: false
      t.string      :tag,        null: false
      t.string      :title,      null: false
      t.float       :latitude,   null: false
      t.float       :longitude,  null: false

      t.timestamps null: false
    end

    add_index :stops, :tag, unique: :true
    add_index :stops, :route_id
    add_index :stops, [:latitude, :longitude]
  end
end
