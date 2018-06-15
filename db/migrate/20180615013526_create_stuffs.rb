class CreateStuffs < ActiveRecord::Migration[5.1]
  def change
    create_table :stuffs do |t|
      t.string :name
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
