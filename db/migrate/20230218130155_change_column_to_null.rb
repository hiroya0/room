class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
  end

  def up
    change_column_null :rooms, :user_id, true
    change_column_null :rooms, :room_id, true
  end

  def down
    change_column_null :rooms, :user_id, false
    change_column_null :rooms, :room_id, false
  end
end
