class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.belongs_to :magazine
      t.integer :edition
      t.integer :issue
      t.date :date
    end
  end
end
