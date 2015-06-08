class RenameTypeInCoupons < ActiveRecord::Migration
  def up
  	rename_column :coupons, :type, :coupon_type
  end

  def down
  	rename_column :coupons, :coupon_type, :type
  end
end
