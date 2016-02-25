class AddAcceptedToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :accepted, :boolean, default: false
  end
end
