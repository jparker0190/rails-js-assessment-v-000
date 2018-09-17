class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.belongs_to :user
      t.belongs_to :stock
      t.timestamps null: false
    end
  end
end
