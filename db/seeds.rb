EventPeriod.create([
  { :name => "Ежедневное",   :days   => 1 },
  { :name => "Еженедельное", :days   => 7 },
  { :name => "Ежемесячное",  :months => 1 },
  { :name => "Ежегодное",    :years  => 1 }
])

puts "-- [seed] event_periods was seeded"
