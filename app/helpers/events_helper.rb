module EventsHelper
  def formatted_event_datetime(datetime)
    return "" if datetime.blank?

    datetime.strftime("%A %-d#{datetime.day.ordinal} %B %H:%M")
  end
end
