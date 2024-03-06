namespace :hexlet do
  desc 'Import users from a CSV file'
  task :import_users, [:file_path] => :environment do |t, args|
    require 'csv'
    require 'date'

    file_path = args[:file_path]

    if file_path.blank?
      puts 'You need to specify a file path.'
      exit
    end

    unless File.exist?(file_path)
      puts "File #{file_path} not found."
      exit
    end

    puts "Importing users from #{file_path}..."

    CSV.foreach(file_path, headers: true) do |row|
      birthday = Date.strptime(row['birthday'], '%m/%d/%Y')
      
      User.create!(
        first_name: row['first_name'],
        last_name: row['last_name'],
        birthday: birthday,
        email: row['email']
      )
    end

    puts 'Import finished successfully.'
  end
end
