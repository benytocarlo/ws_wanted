class CreateSonies < ActiveRecord::Migration
  def change
    create_table :sonies do |t|
      t.string :facebook_id
      t.integer :intentos
      t.text :amigos_share
      t.text :detalle
      t.timestamps
    end
  end
end
