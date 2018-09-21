class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.belongs_to :user
      t.belongs_to :stock
      t.string :name
      t.timestamps null: false
    end
  end
end
