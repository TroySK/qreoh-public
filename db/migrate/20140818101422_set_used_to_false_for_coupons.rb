class SetUsedToFalseForCoupons < ActiveRecord::Migration
  def up
    change_column :coupons, :used, :boolean, :default => false
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
