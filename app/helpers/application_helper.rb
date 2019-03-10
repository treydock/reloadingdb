module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def index_actions(object)
    content_tag :div, class: 'dropdown' do
      concat button_tag('Actions', class: 'btn btn-secondary dropdown-toggle', id: 'button', type: 'button', 'aria-haspopup' => 'true', 'aria-expanded' => 'false', data: { toggle: 'dropdown' })
      concat(content_tag(:div, class: 'dropdown-menu', 'aria-labelledby' => 'actions-dropdown') do
        concat link_to('Show', object, class: 'dropdown-item')
        concat link_to('Edit', send("edit_#{object.model_name.singular_route_key}_path", object), class: 'dropdown-item')
        concat link_to('Destroy', object, method: :delete, data: { confirm: 'Are you sure?'}, class: 'dropdown-item')
      end)
    end
  end

  def index_header(object)
    content_tag :div, class: 'page-header pb-2 mt-2 mb-2' do
      concat(link_to(send("new_#{object.model_name.singular_route_key}_path"), class: 'btn btn-primary') do
        content_tag(:span, "New #{object.model_name.name}", class: 'fa fa-plus')
      end)
      concat(content_tag(:h2, "List #{object.model_name.name.pluralize}"))
    end
  end

  def show_header(object)
    content_tag :div, class: 'page-header pb-2 mt-2 mb-2 border-bottom' do
      concat(link_to(send("edit_#{object.model_name.singular_route_key}_path", object), class: 'btn btn-info') do
        content_tag(:span, 'Edit', class: 'fa fa-edit')
      end)
      concat(link_to(send("#{object.model_name.route_key}_path"), class: 'btn btn-outline-secondary') do
        content_tag(:span, 'Back', class: 'fa fa-list')
      end)
      concat(content_tag(:h2, "Show #{object.model_name.name}"))
    end
  end

  def new_header(object)
    content_tag :div, class: 'page-header pb-2 mt-2 mb-2 border-bottom' do
      concat(link_to(send("#{object.model_name.route_key}_path"), class: 'btn btn-outline-secondary') do
        content_tag(:span, 'Back', class: 'fa fa-list')
      end)
      concat(content_tag(:h2, "New #{object.model_name.name}"))
    end
  end

  def edit_header(object)
    content_tag :div, class: 'page-header pb-2 mt-2 mb-2 border-bottom' do
      concat(link_to(object, class: 'btn btn-info') do
        content_tag(:span, 'Show', class: 'fa fa-search')
      end)
      concat(link_to(send("#{object.model_name.route_key}_path"), class: 'btn btn-outline-secondary') do
        content_tag(:span, 'Back', class: 'fa fa-list')
      end)
      concat(content_tag(:h2, "Show #{object.model_name.name}"))
    end
  end
end
