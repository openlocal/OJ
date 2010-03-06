module ApplicationHelper
  def order_attribute(attribute)
    attribute = params[:order] || attribute
    if attribute[/\sASC/]
      attribute.gsub(/\sASC/, ' DESC')
    else
      attribute.gsub(/\sDESC/, ' ASC')
    end
  end
end
