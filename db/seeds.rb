# Provinces
Province.destroy_all

provinces = [
  { name: "Alberta", abbreviation: "AB", gst_rate: 0.05, pst_rate: 0.0, hst_rate: 0.0 },
  { name: "British Columbia", abbreviation: "BC", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.0 },
  { name: "Manitoba", abbreviation: "MB", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.0 },
  { name: "New Brunswick", abbreviation: "NB", gst_rate: 0.0, pst_rate: 0.0, hst_rate: 0.15 },
  { name: "Newfoundland and Labrador", abbreviation: "NL", gst_rate: 0.0, pst_rate: 0.0, hst_rate: 0.15 },
  { name: "Northwest Territories", abbreviation: "NT", gst_rate: 0.05, pst_rate: 0.0, hst_rate: 0.0 },
  { name: "Nova Scotia", abbreviation: "NS", gst_rate: 0.0, pst_rate: 0.0, hst_rate: 0.15 },
  { name: "Nunavut", abbreviation: "NU", gst_rate: 0.05, pst_rate: 0.0, hst_rate: 0.0 },
  { name: "Ontario", abbreviation: "ON", gst_rate: 0.0, pst_rate: 0.0, hst_rate: 0.13 },
  { name: "Prince Edward Island", abbreviation: "PE", gst_rate: 0.0, pst_rate: 0.0, hst_rate: 0.15 },
  { name: "Quebec", abbreviation: "QC", gst_rate: 0.05, pst_rate: 0.09975, hst_rate: 0.0 },
  { name: "Saskatchewan", abbreviation: "SK", gst_rate: 0.05, pst_rate: 0.06, hst_rate: 0.0 },
  { name: "Yukon", abbreviation: "YT", gst_rate: 0.05, pst_rate: 0.0, hst_rate: 0.0 },
]

provinces.each { |p| Province.create!(p) }
puts "Seeded #{Province.count} provinces."

# Categories
camping = Category.find_or_create_by!(name: "Camping") { |c| c.slug = "camping"; c.description = "Tents, sleeping bags, and campsite gear." }
hiking = Category.find_or_create_by!(name: "Hiking") { |c| c.slug = "hiking"; c.description = "Boots, packs, and trail accessories." }
winter = Category.find_or_create_by!(name: "Winter Sports") { |c| c.slug = "winter-sports"; c.description = "Snowshoes, jackets, and cold weather gear." }
water = Category.find_or_create_by!(name: "Water Sports") { |c| c.slug = "water-sports"; c.description = "Kayaks, paddles, and water accessories." }

# Products
products = [
  { name: "Coleman Sundome 4-Person Tent", description: "A reliable dome tent with WeatherTec system to keep you dry. Features two doors and windows for ventilation. Sets up in about 10 minutes.", price: 129.99, stock_quantity: 15, on_sale: false, category: camping },
  { name: "Marmot Trestles 15 Sleeping Bag", description: "Synthetic insulation sleeping bag rated to -9C. Includes a full-length zipper draft tube and a trapezoidal footbox for extra comfort.", price: 109.99, stock_quantity: 20, on_sale: false, category: camping },
  { name: "MSR PocketRocket 2 Stove", description: "Ultralight backpacking stove that weighs only 73 grams. Boils 1L of water in 3.5 minutes. Works with standard isobutane-propane canisters.", price: 59.99, stock_quantity: 25, on_sale: true, sale_price: 44.99, category: camping },
  { name: "Osprey Atmos AG 65 Backpack", description: "65L backpacking pack with Anti-Gravity suspension system that distributes weight evenly. Fits torso lengths from 16 to 21 inches.", price: 349.99, stock_quantity: 10, on_sale: false, category: hiking },
  { name: "Salomon X Ultra 4 GTX Hiking Boots", description: "Waterproof Gore-Tex hiking boots with Contagrip sole for traction on wet and dry surfaces. Lightweight at 680g per pair.", price: 239.99, stock_quantity: 18, on_sale: false, category: hiking },
  { name: "Black Diamond Trail Trekking Poles", description: "Adjustable aluminum trekking poles with FlickLock Pro adjustment and carbide tip. Collapse to 64cm for easy packing.", price: 89.99, stock_quantity: 30, on_sale: true, sale_price: 69.99, category: hiking },
  { name: "MSR Lightning Ascent Snowshoes", description: "Technical snowshoes built for steep and icy terrain. Rotating toe cord and aggressive steel crampon provide grip on hard pack.", price: 299.99, stock_quantity: 12, on_sale: false, category: winter },
  { name: "Arc'teryx Gamma MX Jacket", description: "Softshell jacket with Polartec Powerstretch fabric. Wind and water resistant with articulated patterning for unrestricted movement.", price: 379.99, stock_quantity: 8, on_sale: false, category: winter },
  { name: "Advanced Elements AdvancedFrame Kayak", description: "Inflatable kayak with aluminum rib frame in the bow and stern for tracking. Fits in a large duffel bag and sets up in 15 minutes.", price: 599.99, stock_quantity: 5, on_sale: false, category: water },
  { name: "Werner Camano Paddle", description: "Fiberglass kayak paddle with mid-size blade for efficient cruising. Available in 220cm and 230cm shaft lengths. Weighs 620g.", price: 179.99, stock_quantity: 14, on_sale: false, category: water },
]

products.each do |attrs|
  category = attrs.delete(:category)
  product = Product.find_or_create_by!(name: attrs[:name]) do |p|
    p.assign_attributes(attrs)
  end
  ProductCategory.find_or_create_by!(product: product, category: category)
end

puts "Seeded #{Product.count} products and #{Category.count} categories."