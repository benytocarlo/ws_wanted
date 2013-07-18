class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :description
      t.string :facebook_id
      t.references :code

      t.timestamps
    end
    add_index :prizes, :code_id
  end
end
