class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string      :tag,   null: false
      t.string      :title, null: false

      t.timestamps null: false
    end

  end
end
