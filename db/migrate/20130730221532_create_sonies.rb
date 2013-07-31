class CreateSonies < ActiveRecord::Migration
  def change
    create_table :sonies do |t|
      t.string :facebook_id
      t.integer :intentos
      t.string :amigos_share

      t.timestamps
    end
  end
end
