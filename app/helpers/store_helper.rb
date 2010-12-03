module StoreHelper
  def number_to_currency(number, options= {:unit => "lv", :separator => ".", :format => "%n %u"})
    Object.new.extend(ActionView::Helpers::NumberHelper).number_to_currency(number, options)
    #formata na valutata moje da se smeni, ot koia strana da vadi parichniat znak. unit beshe: &euro
  end
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
 	attributes["style" ] = "display: none"
    end
	content_tag("div" , attributes, &block)
  end
end
