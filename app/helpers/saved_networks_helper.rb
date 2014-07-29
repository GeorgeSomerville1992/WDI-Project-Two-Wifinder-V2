module SavedNetworksHelper
  include ActionView::Helpers::TagHelper
  def marker_legend data
    [content_tag(:h4, "Network Name: "), content_tag(:h3, data.wifi_name), content_tag(:h4, "Network Password: "), content_tag(:h3, data.wifi_pw)].join
  end
end
