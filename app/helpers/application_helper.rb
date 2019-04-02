module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
      when 'recaptcha_error' then 'alert alert-danger'
    end
  end

  def print_time(time)
    time.strftime("%H:%M")
  end

  def index_actions(object, &block)
    content_tag :div, class: 'dropdown' do
      concat button_tag('Actions', class: 'btn btn-secondary dropdown-toggle', id: 'button', type: 'button', 'aria-haspopup' => 'true', 'aria-expanded' => 'false', data: { toggle: 'dropdown' })
      concat(content_tag(:div, class: 'dropdown-menu', 'aria-labelledby' => 'actions-dropdown') do
        concat link_to('Show', object, class: 'dropdown-item')
        concat link_to('Edit', send("edit_#{object.model_name.singular_route_key}_path", object), class: 'dropdown-item')
        concat link_to('Destroy', object, method: :delete, data: { confirm: 'Are you sure?'}, class: 'dropdown-item')
        yield if block_given?
      end)
    end
  end

  def search_bar(object)
    form_tag(send("#{object.model_name.route_key}_path"), method: :get, role: 'form', id: 'search') do
      concat(content_tag(:div, class: 'input-group md-3') do
        concat text_field_tag 'search', params[:search], class: 'autocomplete-input form-control', autocomplete: 'off', placeholder: 'Search...', 'data-url' => send("autocomplete_#{object.model_name.route_key}_path")
        concat(content_tag(:div, class: 'input-group-append') do
          concat submit_tag "Search", class: 'btn btn-outline-secondary'
          concat submit_tag "Reset", class: 'btn btn-outline-secondary', type: 'reset', id: 'search-reset'
        end)
      end)
    end
  end

  def pagination(obj)
    content_tag(:div, class: 'container') do
      concat(content_tag(:div, class: 'row') do
        concat(content_tag(:div, class: 'col-3') do
          concat(form_tag(send("#{obj.model_name.route_key}_path"), method: :get, id: 'per_page_form') do
            concat(hidden_field_tag(:column, params[:column]))
            concat(hidden_field_tag(:direction, params[:direction]))
            concat(select_tag(:per_page, options_for_select([15,25,50,100], selected: (params[:per_page] || obj.default_per_page))))
            concat(label_tag('per page', nil, class: 'ml-1'))
          end)
        end)
        concat(content_tag(:div, class: 'col-7 offset-2') do
          concat(paginate(instance_variable_get("@#{obj.model_name.route_key}"), theme: 'twitter-bootstrap-4'))
        end)
      end)
    end
  end

  def index_header(object)
    content_tag :div, class: 'page-header pb-2 mt-2 mb-2' do
      concat(link_to(send("new_#{object.model_name.singular_route_key}_path"), class: 'btn btn-primary') do
        content_tag(:span, "New #{object.model_name.name.titlecase}", class: 'fa fa-plus')
      end)
      concat(content_tag(:h2, "List #{object.model_name.name.pluralize.titlecase}"))
    end
  end

  def show_header(object, &block)
    content_tag :div, class: 'page-header pb-2 mt-2 mb-2 border-bottom' do
      concat(link_to(send("#{object.model_name.route_key}_path"), class: 'btn btn-outline-secondary') do
        content_tag(:span, 'Back', class: 'fa fa-list')
      end)
      concat(link_to(send("edit_#{object.model_name.singular_route_key}_path", object), class: 'btn btn-info') do
        content_tag(:span, 'Edit', class: 'fa fa-edit')
      end)
      yield if block_given?
      concat(content_tag(:h2, "Show #{object.model_name.name.titlecase}"))
    end
  end

  def new_header(object)
    content_tag :div, class: 'page-header pb-2 mt-2 mb-2 border-bottom' do
      concat(link_to(send("#{object.model_name.route_key}_path"), class: 'btn btn-outline-secondary') do
        content_tag(:span, 'Back', class: 'fa fa-list')
      end)
      concat(content_tag(:h2, "New #{object.model_name.name.titlecase}"))
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
      concat(content_tag(:h2, "Show #{object.model_name.name.titlecase}"))
    end
  end

  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "fa fa-chevron-up" : "fa fa-chevron-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe,
      {search: params[:search], page: params[:page], per_page: params[:per_page], column: column, direction: direction}
  end
end
