class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :tag,    null: false
      t.string :title,  null: false

      t.timestamps null: false
    end

    add_index :routes, :tag, unique: true
  end
end
