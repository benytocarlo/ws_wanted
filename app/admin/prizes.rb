ActiveAdmin.register Prize do
  index do                       
    selectable_column
    column :description
    column :facebook_id
    column :code_id
    default_actions                   
  end  

  form do |f|                         
    f.inputs "Prize Details" do       
      f.input :description                  
      f.input :facebook_id            
    end                               
    f.actions                         
  end
end
