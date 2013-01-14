module BootstrapHelper
  def bootstrap_input(form_helper, type, field)
    content_tag("div", class: "control-group") do
      form_helper.label(field, nil, class: "control-label") +
      content_tag("div", class: "controls") do
        form_helper.send(type, field)
      end
    end
  end

  def bootstrap_text_field(form_helper, field)
    bootstrap_input(form_helper, :text_field, field)
  end
end
