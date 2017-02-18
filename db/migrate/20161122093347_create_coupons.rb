class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
    	t.string :coupon_code
    	t.string :coupon_type
    	t.integer :discount_amount
    	t.string :coupon_name
    	t.date  :start_date
    	t.date :end_date
    	t.boolean :status


      t.timestamps null: false
    end
  end
end
