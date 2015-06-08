class AddStatusToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :status, :integer, :default => 0
  end
end
