# frozen_string_literal: true

class ArrayInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:type] ||= input_type
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    existing_values = Array(object.public_send(attribute_name)).map do |array_el|
      @builder.text_field(attribute_name, merged_input_options.merge(value: array_el, name: "#{object_name}[#{attribute_name}][]"))
    end

    existing_values.push @builder.text_field(attribute_name, merged_input_options.merge(value: nil, name: "#{object_name}[#{attribute_name}][]"))
    existing_values.join.html_safe
  end

  def input_type
    :text
  end
end
