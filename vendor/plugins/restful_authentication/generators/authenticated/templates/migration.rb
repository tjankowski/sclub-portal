# -*- encoding : utf-8 -*-
class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table "<%= table_name %>", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      <% if options[:include_activation] %>t.column :activation_code, :string, :limit => 40
      t.column :activated_at, :datetime<% end %>
      <% if options[:stateful] %>t.column :state, :string, :null => :no, :default => 'passive'
      t.column :deleted_at, :datetime<% end %>
    end
  end

  def self.down
    drop_table "<%= table_name %>"
  end
end
