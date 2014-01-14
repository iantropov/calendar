class AddEventPeriodColumn < ActiveRecord::Migration
  def up
    add_column    :events, :event_period_id, :integer
    change_column :events, :event_period_id, :integer, :null => false
  end

  def down
    remove_column :events, :event_period_id
  end
end
