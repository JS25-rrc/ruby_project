ActiveAdmin.register Page do
  permit_params :title, :slug, :content

  filter :title
  filter :slug

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :content, as: :text, input_html: { rows: 10 }
    end
    f.actions
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "slug", "created_at", "updated_at"]
  end
end