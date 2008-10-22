class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.integer :upload_id
      t.string :email_address
      t.string :identity_url
      t.string :token
      t.string :password
      t.timestamp :created_on

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
