class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :name, :null => false
      t.date :date,   :null => false
    end
  end
end
