# frozen_string_literal: true

class DatePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:data] ||= {}
    input_html_options[:data][:target] = "#datepicker"
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    template.content_tag :div, class: "input-group date date-picker", id: "datepicker", data: { "target-input" => "nearest" } do
      input = @builder.text_field(attribute_name, merged_input_options)
      input += template.content_tag :div, class: "input-group-append", data: { target: "#datepicker", toggle: "datetimepicker" } do
        template.content_tag :div, class: "input-group-text" do
          template.content_tag :i, "", class: "fa fa-calendar fa-lg"
        end
      end
      input
    end
  end
end
