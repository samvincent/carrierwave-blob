class CarrierWaveBlobMigrationGenerator < Rails::Generators::NamedBase
  desc    "Creates a migration to update column type to text"
  argument :fieldname, default: 'picture'

  check_class_collision

  def create_migration_file
    migration_nr = ActiveRecord::Migration.next_migration_number(Time.now.to_i)
    create_file "db/migrate/#{migration_nr}_update_#{name.downcase}_#{fieldname.downcase}_column.rb",
    <<-CONTENT.gsub(/^\s{6}/, '')
      class Update#{name.capitalize}#{fieldname.capitalize}Column < ActiveRecord::Migration
        def change
          change_column :#{name.tableize}, :#{fieldname}, :text, limit: nil
        end
      end

    CONTENT
    say "Don't forget to run `rake db:migrate`!", :yellow
  end
end
