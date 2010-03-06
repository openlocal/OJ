module ApplicationHelper
  def order_attribute(attribute)
    attribute = params[:order] || attribute
    if attribute[/\sASC/]
      attribute.gsub(/\sASC/, ' DESC')
    else
      attribute.gsub(/\sDESC/, ' ASC')
    end
  end
  
  def gravatar(email, css_class = '')
    return "<img src=\"http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?d=identicon&r=g\" class=\"#{css_class}\"/>"
  end
end
