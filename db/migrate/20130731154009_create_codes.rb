class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :description
      t.boolean :activo
      t.string :facebook_id

      t.timestamps
    end
  end
end
