class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans, id: :bigserial do |t|
      t.string :name, null: false
      t.decimal :price_monthly, precision: 9, scale: 2
      t.decimal :price_yearly, precision: 9, scale: 2
      t.string :additional_user_fee
      t.integer :user_limit
      t.timestamps
      t.index ['name'], unique: true
    end
  end
end
