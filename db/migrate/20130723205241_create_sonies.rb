class CreateSonies < ActiveRecord::Migration
  def change
    create_table :sonies do |t|
      t.string :id_facebook
      t.integer :intentos
      t.string :amigos_share

      t.timestamps
    end
  end
end
