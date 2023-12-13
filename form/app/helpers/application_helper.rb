# app/helpers/application_helper.rb

module ApplicationHelper
  def display_errors(model, attribute)
    if model.errors[attribute].any?
      content_tag(:div, "#{attribute.to_s.humanize} #{model.errors[attribute].to_sentence}", class: 'alert')
    end
  end
end
