class DatetimePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({target: '#datetimepicker'})
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    template.content_tag :div, class: 'input-group date datetime-picker', id: 'datetimepicker', data: { 'target-input' => 'nearest' } do
      input = @builder.text_field(attribute_name, merged_input_options)
      input += template.content_tag :div, class: 'input-group-append', data: { target: '#datetimepicker', toggle: 'datetimepicker' } do
        template.content_tag :div, class: 'input-group-text' do
          template.content_tag :i, '', class: 'fa fa-calendar fa-lg'
        end
      end
      input
    end
  end
end

