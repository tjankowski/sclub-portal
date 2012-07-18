# -*- encoding : utf-8 -*-
class AddAttachmentsLogoToClub < ActiveRecord::Migration
  def self.up

    add_column :clubs, :logo_file_name, :string
    add_column :clubs, :logo_content_type, :string
    add_column :clubs, :logo_file_size, :integer
    add_column :clubs, :logo_updated_at, :datetime

  end

  def self.down

    remove_column :clubs, :logo_file_name
    remove_column :clubs, :logo_content_type
    remove_column :clubs, :logo_file_size
    remove_column :clubs, :logo_updated_at

  end
end
