module NavHelper
  def currently_at(place)
    @active = place
    content_for("top_nav") do
      render :partial => "layouts/top_nav"
    end
  end

  def nav_link(name, destination, options)
    link_name = options.delete(:name)
    active_link_name = @active

    klass = ""
    if active_link_name == link_name
      klass = "active"
    end

    content_tag("li", class: klass) do
      link_to name, destination, options
    end
  end
end
