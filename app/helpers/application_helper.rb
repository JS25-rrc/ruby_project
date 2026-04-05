module ApplicationHelper
  def breadcrumbs(*crumbs)
    content_tag :nav, "aria-label": "breadcrumb" do
      content_tag :ol, class: "breadcrumb" do
        crumbs.map.with_index do |crumb, i|
          if i == crumbs.length - 1
            content_tag :li, crumb[:name], class: "breadcrumb-item active"
          else
            content_tag :li, class: "breadcrumb-item" do
              link_to crumb[:name], crumb[:path]
            end
          end
        end.join.html_safe
      end
    end
  end
end