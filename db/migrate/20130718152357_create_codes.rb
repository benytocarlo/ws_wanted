class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :number
      t.boolean :status

      t.timestamps
    end
  end
end
