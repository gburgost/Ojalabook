class AddImageToStatuses < ActiveRecord::Migration[5.0]
  def self.up
    change_table :statuses do |t|
      t.attachment :imagen
    end
  end

  def self.down
    drop_attached_file :statuses, :imagen
  end
end
