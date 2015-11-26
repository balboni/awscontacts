class AddDetailsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse, :string
    add_column :contacts, :children, :string
  end
end
