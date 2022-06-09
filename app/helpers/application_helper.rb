module ApplicationHelper
  def price(object)
    number_to_currency(object.price, precision: 2)
  end

  def day_and_time(object)
    object.departure_date.strftime("%B %d at %I:%M %P")
  end

  def permit_extra_luggage(object)
    if object.extra_luggage?
      "Yes"
    else
      "No"
    end
  end
end
