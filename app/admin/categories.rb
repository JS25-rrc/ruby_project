ActiveAdmin.register Category do
  permit_params :name, :description, :slug

  filter :name
  filter :slug
end