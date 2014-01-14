describe CalendarService do
  let (:service) { CalendarService }
  let(:month_period) { create(:event_period, :months => 1, :days => 0, :years => 0) }
  let(:day_period)   { create(:event_period, :months => 0, :days => 1, :years => 0) }
  let(:year_period)  { create(:event_period, :months => 0, :days => 0, :years => 1) }

  describe "#get_calendar_for" do
    it "returns empty list for empty input" do
      service.get_calendar_for([]).should be_empty
    end

    it "returns occurences for month event" do
      month_event = create(:event, :date => "2014-01-01", :event_period => month_period)
      service.get_calendar_for([month_event]).length.should be_eql 12
    end

    it "returns occurences for many events" do
      month_event = create(:event, :date => "2014-01-01", :event_period => month_period)
      day_event   = create(:event, :date => "2014-12-01", :event_period => day_period)
      year_event  = create(:event, :date => "2014-08-01", :event_period => year_period)

      service.get_calendar_for([month_event, day_event, year_event]).length.should be_eql 12 + 31 + 1
    end

  end
end
