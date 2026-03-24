# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[7.2]
  def self.up
    # We are leaving this empty because the columns (email, encrypted_password, etc.)
    # already exist in the database from a previous attempt.
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end