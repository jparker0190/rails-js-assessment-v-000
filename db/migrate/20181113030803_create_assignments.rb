class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :direction, :default => "Buy"
      t.integer :shares
      t.integer :stock_id
      t.integer :portfolio_id
      t.timestamps
    end
  end
end
