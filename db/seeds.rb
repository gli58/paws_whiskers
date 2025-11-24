puts "Clearing existing data..."
ProductCategory.destroy_all
Product.destroy_all
Category.destroy_all
Province.destroy_all
Page.destroy_all

puts "Creating provinces..."
provinces_data = [
  { name: 'Alberta', abbreviation: 'AB', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 },
  { name: 'British Columbia', abbreviation: 'BC', gst_rate: 5.0, pst_rate: 7.0, hst_rate: 0.0 },
  { name: 'Manitoba', abbreviation: 'MB', gst_rate: 5.0, pst_rate: 7.0, hst_rate: 0.0 },
  { name: 'New Brunswick', abbreviation: 'NB', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Newfoundland and Labrador', abbreviation: 'NL', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Northwest Territories', abbreviation: 'NT', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 },
  { name: 'Nova Scotia', abbreviation: 'NS', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Nunavut', abbreviation: 'NU', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 },
  { name: 'Ontario', abbreviation: 'ON', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 13.0 },
  { name: 'Prince Edward Island', abbreviation: 'PE', gst_rate: 0.0, pst_rate: 0.0, hst_rate: 15.0 },
  { name: 'Quebec', abbreviation: 'QC', gst_rate: 5.0, pst_rate: 9.975, hst_rate: 0.0 },
  { name: 'Saskatchewan', abbreviation: 'SK', gst_rate: 5.0, pst_rate: 6.0, hst_rate: 0.0 },
  { name: 'Yukon', abbreviation: 'YT', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0 }
]
provinces_data.each { |data| Province.create!(data) }

puts "Creating pages..."
Page.create!(title: 'About Paws & Whiskers', slug: 'about',
  content: 'Paws & Whiskers is an established Winnipeg-based pet supply retailer that has been serving the local community for over 12 years. We operate two brick-and-mortar locations in Winnipeg.')

Page.create!(title: 'Contact Us', slug: 'contact',
  content: 'Contact us at info@pawswhiskers.com or call 204-555-1234. Visit our stores in South End (Kenaston area) and North End (Garden City).')

puts "Creating categories..."
categories = [
  { name: 'Dog Food', description: 'Premium dog foods and treats' },
  { name: 'Cat Food', description: 'Quality cat food and treats' },
  { name: 'Pet Toys', description: 'Fun toys for all pets' },
  { name: 'Grooming', description: 'Grooming supplies and accessories' },
  { name: 'Small Animals', description: 'Supplies for rabbits, hamsters, guinea pigs' },
  { name: 'Bird Supplies', description: 'Food and accessories for birds' },
  { name: 'Fish & Aquarium', description: 'Aquarium supplies and fish food' },
  { name: 'Pet Health', description: 'Health and wellness products' }
]
categories.each { |cat| Category.create!(cat) }

puts "Creating products..."
dog_food = Category.find_by(name: 'Dog Food')
cat_food = Category.find_by(name: 'Cat Food')
toys = Category.find_by(name: 'Pet Toys')
grooming = Category.find_by(name: 'Grooming')
small_animals = Category.find_by(name: 'Small Animals')
birds = Category.find_by(name: 'Bird Supplies')
fish = Category.find_by(name: 'Fish & Aquarium')
health = Category.find_by(name: 'Pet Health')

products_data = [
  # Dog Food
  { name: 'Premium Dry Dog Food 15kg', description: 'High-quality dry dog food with real chicken and vegetables. Perfect for adult dogs.', price: 59.99, category: dog_food },
  { name: 'Grain-Free Dog Food 10kg', description: 'Grain-free formula for dogs with sensitive stomachs. Made with salmon and sweet potato.', price: 69.99, category: dog_food },
  { name: 'Puppy Food 5kg', description: 'Specially formulated for growing puppies. Rich in DHA for brain development.', price: 39.99, category: dog_food },
  { name: 'Senior Dog Food 12kg', description: 'Lower calorie formula for senior dogs. Supports joint health.', price: 54.99, category: dog_food },
  { name: 'Wet Dog Food Variety Pack', description: 'Pack of 12 cans. Multiple flavors including beef, chicken, and lamb.', price: 24.99, category: dog_food },
  { name: 'Organic Dog Treats', description: 'All-natural organic treats. No artificial preservatives or colors.', price: 12.99, category: dog_food },
  { name: 'Dental Chews for Dogs', description: 'Helps reduce tartar and freshen breath. Veterinarian recommended.', price: 18.99, category: dog_food },
  { name: 'Training Treats', description: 'Small soft treats perfect for training. Low calorie.', price: 9.99, category: dog_food },
  { name: 'Bully Sticks 10 Pack', description: 'Long-lasting natural chews. 100% beef.', price: 29.99, category: dog_food },
  { name: 'Peanut Butter Dog Biscuits', description: 'Crunchy biscuits made with real peanut butter.', price: 11.99, category: dog_food },

  # Cat Food
  { name: 'Premium Cat Food 8kg', description: 'Complete nutrition for adult cats. Made with real salmon.', price: 49.99, category: cat_food },
  { name: 'Grain-Free Cat Food 5kg', description: 'Grain-free formula with high protein content. Made with chicken.', price: 44.99, category: cat_food },
  { name: 'Kitten Food 3kg', description: 'Special formula for kittens up to 1 year old.', price: 29.99, category: cat_food },
  { name: 'Senior Cat Food 7kg', description: 'Lower calorie formula for senior cats over 7 years.', price: 42.99, category: cat_food },
  { name: 'Wet Cat Food Variety Pack', description: 'Pack of 24 cans. Assorted flavors including tuna, chicken, and turkey.', price: 32.99, category: cat_food },
  { name: 'Cat Treats Salmon Flavor', description: 'Crunchy treats with real salmon. Cats love them!', price: 8.99, category: cat_food },
  { name: 'Catnip Treats', description: 'Treats infused with premium catnip. Great for rewards.', price: 7.99, category: cat_food },
  { name: 'Hairball Control Treats', description: 'Helps reduce hairballs naturally.', price: 10.99, category: cat_food },
  { name: 'Freeze-Dried Cat Treats', description: '100% pure chicken freeze-dried treats.', price: 15.99, category: cat_food },
  { name: 'Dental Cat Treats', description: 'Helps clean teeth and freshen breath.', price: 9.99, category: cat_food },

  # Pet Toys
  { name: 'Rope Toy for Dogs', description: 'Durable rope toy perfect for tug-of-war.', price: 12.99, category: toys },
  { name: 'Squeaky Ball 3-Pack', description: 'Set of 3 colorful squeaky balls.', price: 14.99, category: toys },
  { name: 'Plush Dog Toy', description: 'Soft plush toy with squeaker inside.', price: 11.99, category: toys },
  { name: 'Rubber Chew Toy', description: 'Indestructible rubber toy for aggressive chewers.', price: 16.99, category: toys },
  { name: 'Interactive Puzzle Toy', description: 'Keep your dog mentally stimulated. Hide treats inside.', price: 24.99, category: toys },
  { name: 'Frisbee for Dogs', description: 'Soft rubber frisbee safe for teeth.', price: 13.99, category: toys },
  { name: 'Tug Toy with Handle', description: 'Great for interactive play with your dog.', price: 15.99, category: toys },
  { name: 'Cat Feather Wand', description: 'Interactive wand toy with feathers.', price: 9.99, category: toys },
  { name: 'Catnip Mice 5-Pack', description: 'Set of 5 mice filled with premium catnip.', price: 12.99, category: toys },
  { name: 'Cat Laser Pointer', description: 'Keep your cat entertained for hours.', price: 8.99, category: toys },
  { name: 'Cat Scratching Post', description: 'Sisal rope scratching post. Saves your furniture.', price: 34.99, category: toys },
  { name: 'Cat Tunnel', description: 'Collapsible tunnel for cat play.', price: 19.99, category: toys },
  { name: 'Cat Ball Track Toy', description: 'Three-level track with rolling balls.', price: 21.99, category: toys },
  { name: 'Treat Dispenser Ball', description: 'Dispenses treats as pet plays with it.', price: 14.99, category: toys },

  # Grooming
  { name: 'Dog Shampoo 500ml', description: 'Gentle formula with oatmeal. For sensitive skin.', price: 16.99, category: grooming },
  { name: 'Cat Shampoo 400ml', description: 'Tear-free formula specially made for cats.', price: 14.99, category: grooming },
  { name: 'Slicker Brush', description: 'Removes loose hair and prevents matting.', price: 12.99, category: grooming },
  { name: 'Nail Clippers for Dogs', description: 'Professional-grade nail clippers with safety guard.', price: 15.99, category: grooming },
  { name: 'Nail Clippers for Cats', description: 'Small precision clippers for cat claws.', price: 11.99, category: grooming },
  { name: 'De-Shedding Tool', description: 'Reduces shedding by up to 90%.', price: 24.99, category: grooming },
  { name: 'Pet Hair Dryer', description: 'Low-noise dryer with adjustable heat settings.', price: 49.99, category: grooming },
  { name: 'Grooming Glove', description: 'Gentle grooming and massage glove.', price: 13.99, category: grooming },
  { name: 'Pet Wipes 100-Pack', description: 'Hypoallergenic wipes for quick cleanups.', price: 11.99, category: grooming },
  { name: 'Ear Cleaning Solution', description: 'Gentle formula for cleaning pet ears.', price: 12.99, category: grooming },
  { name: 'Pet Toothbrush Set', description: 'Includes toothbrush and toothpaste.', price: 14.99, category: grooming },
  { name: 'Flea Comb', description: 'Fine-toothed comb for removing fleas.', price: 8.99, category: grooming },

  # Small Animals
  { name: 'Hamster Food 2kg', description: 'Complete nutrition for hamsters.', price: 14.99, category: small_animals },
  { name: 'Rabbit Pellets 5kg', description: 'High-fiber pellets for rabbits.', price: 24.99, category: small_animals },
  { name: 'Guinea Pig Food 3kg', description: 'Vitamin C enriched food for guinea pigs.', price: 19.99, category: small_animals },
  { name: 'Small Animal Cage', description: 'Spacious cage with multiple levels.', price: 89.99, category: small_animals },
  { name: 'Exercise Wheel', description: 'Silent spinner wheel for hamsters.', price: 16.99, category: small_animals },
  { name: 'Water Bottle', description: 'Leak-proof water bottle for small pets.', price: 7.99, category: small_animals },
  { name: 'Pet Bedding 5L', description: 'Soft paper bedding. Dust-free and absorbent.', price: 12.99, category: small_animals },
  { name: 'Timothy Hay 1kg', description: 'Premium hay for rabbits and guinea pigs.', price: 15.99, category: small_animals },
  { name: 'Chew Sticks 20-Pack', description: 'Natural wood chew sticks.', price: 8.99, category: small_animals },
  { name: 'Hideout House', description: 'Wooden hideout for small pets.', price: 18.99, category: small_animals },

  # Bird Supplies
  { name: 'Parakeet Food 1kg', description: 'Seed mix for parakeets.', price: 11.99, category: birds },
  { name: 'Parrot Food 2kg', description: 'Premium pellets for large parrots.', price: 24.99, category: birds },
  { name: 'Bird Cage Large', description: 'Spacious cage for medium-sized birds.', price: 129.99, category: birds },
  { name: 'Bird Perch Set', description: 'Natural wood perches in various sizes.', price: 16.99, category: birds },
  { name: 'Cuttlebone 3-Pack', description: 'Natural cuttlebone for calcium.', price: 7.99, category: birds },
  { name: 'Bird Treats', description: 'Honey sticks with seeds.', price: 9.99, category: birds },
  { name: 'Bird Bath', description: 'Attachable bird bath for cage.', price: 14.99, category: birds },
  { name: 'Millet Spray 10-Pack', description: 'Natural millet sprays birds love.', price: 12.99, category: birds },
  { name: 'Bird Toy with Bell', description: 'Colorful hanging toy with bell.', price: 11.99, category: birds },
  { name: 'Cage Cover', description: 'Breathable cover for nighttime.', price: 19.99, category: birds },

  # Fish & Aquarium
  { name: 'Fish Food Flakes 200g', description: 'Tropical fish flakes. Complete nutrition.', price: 8.99, category: fish },
  { name: 'Goldfish Food 150g', description: 'Floating pellets for goldfish.', price: 7.99, category: fish },
  { name: 'Aquarium Filter', description: 'Internal filter for tanks up to 40 gallons.', price: 34.99, category: fish },
  { name: 'Air Pump', description: 'Quiet air pump with adjustable flow.', price: 22.99, category: fish },
  { name: 'Aquarium Heater 100W', description: 'Adjustable heater with auto shut-off.', price: 29.99, category: fish },
  { name: 'Aquarium Gravel 5kg', description: 'Natural colored gravel.', price: 12.99, category: fish },
  { name: 'Artificial Plants Set', description: 'Set of 5 plastic plants.', price: 15.99, category: fish },
  { name: 'Fish Net', description: 'Fine mesh net for catching fish.', price: 5.99, category: fish },
  { name: 'Water Conditioner 500ml', description: 'Removes chlorine and heavy metals.', price: 11.99, category: fish },
  { name: 'LED Aquarium Light', description: 'Energy-efficient LED light bar.', price: 39.99, category: fish },
  { name: 'Fish Tank Ornament', description: 'Decorative castle ornament.', price: 16.99, category: fish },
  { name: 'Algae Scraper', description: 'Magnetic algae scraper for glass.', price: 13.99, category: fish },

  # Pet Health
  { name: 'Multivitamin Tablets', description: 'Daily vitamins for dogs and cats.', price: 19.99, category: health },
  { name: 'Joint Supplement', description: 'Glucosamine and chondroitin for joint health.', price: 34.99, category: health },
  { name: 'Probiotics for Pets', description: 'Digestive health supplement.', price: 24.99, category: health },
  { name: 'Flea Treatment 3-Pack', description: 'Topical flea treatment. Lasts 3 months.', price: 42.99, category: health },
  { name: 'Tick Prevention Collar', description: 'Repels ticks and fleas for 8 months.', price: 29.99, category: health },
  { name: 'Dewormer for Dogs', description: 'Broad-spectrum dewormer.', price: 15.99, category: health },
  { name: 'Pet First Aid Kit', description: 'Complete first aid kit for pets.', price: 39.99, category: health },
  { name: 'Wound Care Spray', description: 'Antiseptic spray for minor cuts.', price: 12.99, category: health },
  { name: 'Calming Supplement', description: 'Natural calming aid for anxious pets.', price: 26.99, category: health },
  { name: 'Omega-3 Fish Oil', description: 'Supports skin, coat, and heart health.', price: 21.99, category: health }
]

products_data.each_with_index do |data, index|
  product = Product.create!(
    name: data[:name],
    description: data[:description],
    current_price: data[:price],
    stock_quantity: rand(5..50),
    on_sale: (index % 5 == 0),
    is_new: (index < 15)
  )
  product.categories << data[:category]
end

puts "Created #{Province.count} provinces"
puts "Created #{Page.count} pages"
puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"
puts "Done!"
