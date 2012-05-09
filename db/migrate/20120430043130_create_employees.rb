class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, :null => false, :default=>'Vacant'
      t.string :last_name, :null => false, :default=>'Position'
      t.integer :position
      t.string :position_title
      t.integer :report_to

      t.timestamps
    end
  end
end
