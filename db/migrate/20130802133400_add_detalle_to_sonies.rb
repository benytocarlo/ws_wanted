class AddDetalleToSonies < ActiveRecord::Migration
  def change
    add_column :sonies, :detalle, :text
  end
end
