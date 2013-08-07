ActiveAdmin.register Prize do
  index do                       
    selectable_column
    column :description
    column :facebook_uid
    column :code
    default_actions                   
  end  

  form do |f|                         
    f.inputs "Prize Details" do       
      f.input :description                  
      f.input :facebook_uid            
    end                               
    f.actions                         
  end
end
