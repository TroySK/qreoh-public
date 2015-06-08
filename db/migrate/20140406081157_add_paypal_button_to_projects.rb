class AddPaypalButtonToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :paypal_button, :string
  end
end
