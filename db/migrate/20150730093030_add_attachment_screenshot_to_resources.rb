class AddAttachmentScreenshotToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :screenshot
    end
  end

  def self.down
    remove_attachment :resources, :screenshot
  end
end
