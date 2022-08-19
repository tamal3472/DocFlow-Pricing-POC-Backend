class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans, id: :bigserial do |t|
      t.string :name, null: false
      t.decimal :price_monthly, precision: 9, scale: 2, null: false
      t.decimal :price_yearly, precision: 9, scale: 2, null: false
      t.decimal :additional_user_fee, precision: 9, scale: 2
      t.integer :user_limit, null: false
      t.timestamps
      t.index ['name'], unique: true
    end
  end
end
