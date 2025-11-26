namespace :import do
  desc "Import products from CSV file"
  task products: :environment do
    require 'csv'
    
    csv_file = Rails.root.join('db', 'products_import.csv')
    
    unless File.exist?(csv_file)
      puts "❌ Error: CSV file not found at #{csv_file}"
      exit
    end
    
    puts "=" * 70
    puts "CSV PRODUCT IMPORT"
    puts "=" * 70
    puts "Source file: #{csv_file}"
    puts "Starting import process..."
    puts ""
    
    count = 0
    errors = 0
    
    CSV.foreach(csv_file, headers: true) do |row|
      begin
        product = Product.create!(
          name: row['name'],
          description: row['description'],
          current_price: row['price'].to_f,
          stock_quantity: row['stock'].to_i,
          on_sale: false,
          is_new: true
        )
        
        puts "✓ Created: #{product.name} ($#{product.current_price}) - Stock: #{product.stock_quantity}"
        count += 1
        
      rescue ActiveRecord::RecordInvalid => e
        puts "✗ Error: #{row['name']} - #{e.message}"
        errors += 1
      rescue => e
        puts "✗ Unexpected error: #{row['name']} - #{e.message}"
        errors += 1
      end
    end
    
    puts ""
    puts "=" * 70
    puts "IMPORT COMPLETED"
    puts "=" * 70
    puts "✓ Successfully imported: #{count} products"
    puts "✗ Errors: #{errors}" if errors > 0
    puts "📊 Total products in database: #{Product.count}"
    puts "=" * 70
  end
end
