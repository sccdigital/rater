class RaterInstallGenerator < Rails::Generators::NamedBase
	include Rails::Generators::Migration
	
	def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

	def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end
	
  def create_migration_file
		copy_file 'migration.rb', 'db/migrate/create_ratings_table.rb'
	end
end