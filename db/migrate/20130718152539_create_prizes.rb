class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :description
      t.string :facebook_uid
      t.string :code

      t.timestamps
    end
  end
end
