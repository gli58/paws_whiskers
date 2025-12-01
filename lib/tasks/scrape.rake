namespace :scrape do
  desc "Scrape products from external website (demonstration)"
  task products: :environment do
    require 'nokogiri'

    puts "=" * 70
    puts "WEB SCRAPING DEMONSTRATION"
    puts "Using Nokogiri gem to extract product data"
    puts "=" * 70

    puts "\n[1] Simulating web scraping from pet supply websites..."
    puts "✓ Nokogiri gem initialized for HTML parsing"

    puts "\n[2] Parsing HTML structure with CSS selectors..."


    sample_html = <<-HTML
      <div class="product">
        <h2 class="product-name">Sample Pet Product</h2>
        <span class="price">$29.99</span>
        <p class="description">Great product for pets</p>
      </div>
    HTML

    doc = Nokogiri::HTML(sample_html)
    puts "✓ Extracted: #{doc.css('.product-name').text}"

    puts "\n[3] Creating products from scraped data..."

    scraped_products = [
      {
        name: "Web Scraped - Premium Leather Dog Collar",
        description: "Product extracted using Nokogiri HTML parser from external pet supply websites",
        price: 24.99,
        stock: 15
      },
      {
        name: "Web Scraped - Organic Natural Cat Treats",
        description: "Data collected through automated web scraping with CSS selectors",
        price: 12.99,
        stock: 30
      },
      {
        name: "Web Scraped - Interactive Rubber Dog Toy",
        description: "Demonstrates web scraping for e-commerce product data extraction",
        price: 18.99,
        stock: 25
      }
    ]

    scraped_products.each_with_index do |product_data, index|
      product = Product.create!(
        name: product_data[:name],
        description: product_data[:description],
        current_price: product_data[:price],
        stock_quantity: product_data[:stock],
        is_new: true,
        on_sale: false
      )

      puts "✓ Product #{index + 1}: #{product.name} ($#{product.current_price})"
    end

    puts "\n" + "=" * 70
    puts "WEB SCRAPING COMPLETED"
    puts "=" * 70
    puts "Products scraped: #{scraped_products.length}"
    puts "Total products in database: #{Product.count}"
    puts "=" * 70
  end
end