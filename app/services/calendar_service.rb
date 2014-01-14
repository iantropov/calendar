class CalendarService
  class << self
    def get_calendar_for(events, period_start = Date.current.beginning_of_year, period_end = Date.current.end_of_year)
      return [] if events.empty?

      calendar = []
      events.each do |event|
        schedule = ::IceCube::Schedule.new(event.date)
        add_rules(schedule, event.event_period)
        schedule.occurrences_between(period_start, period_end).each { |occur| calendar.push(:date => occur, :event => event)}
      end
      calendar.sort { |a, b| a[:date] <=> b[:date] }
    end

    private

      def add_rules(schedule, event_period)
        schedule.add_recurrence_rule(::IceCube::Rule.daily(event_period.days))     if event_period.days   > 0
        schedule.add_recurrence_rule(::IceCube::Rule.monthly(event_period.months)) if event_period.months > 0
        schedule.add_recurrence_rule(::IceCube::Rule.yearly(event_period.years))   if event_period.years  > 0
      end

  end
end
