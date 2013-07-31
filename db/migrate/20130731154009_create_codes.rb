class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :description
      t.boolean :estado

      t.timestamps
    end
  end
end
