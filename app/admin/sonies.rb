ActiveAdmin.register Sony do
  index do                       
    selectable_column
    column :id
    column :facebook_id
    column :intentos
    column :amigos_share
    column :created_at
    column :updated_at
    default_actions                   
  end
  form do |f|                         
    f.inputs "Prize Details" do       
      f.input :facebook_id            
      f.input :intentos       
      f.input :amigos_share                  
    end                               
    f.actions                         
  end
end