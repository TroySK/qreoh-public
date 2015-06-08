class AddPaymentOptionsToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :fethr_button, :text
  	add_column :projects, :mywindow_button, :text
  end
end
