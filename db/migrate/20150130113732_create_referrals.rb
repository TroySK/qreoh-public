class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :referrer_type, :default => 0
      t.references :user
      t.integer :referral_count, :default => 0

      t.timestamps
    end
    add_index :referrals, :user_id
  end
end
