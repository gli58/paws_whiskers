namespace :scrape do
  desc "Scrape products from external website (demonstration)"
  task products: :environment do
    require_relative '../scrapers/pet_product_scraper'
    
    puts "Initiating web scraping task..."
    puts "Target: External pet supply websites"
    puts ""
    
    PetProductScraper.scrape_demo
    
    puts "\nAdditional Parsing Example:"
    PetProductScraper.parse_html_example
  end
end
