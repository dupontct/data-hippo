class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :email_address
      t.string :name
      t.string :note
      t.boolean :confirm
      t.string :file
      t.string :local_filename
      t.datetime :expire_date
      t.string :password
      t.string :salt
      t.int :file_size
      t.int :downloads_count
      t.string :md5_digest

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
