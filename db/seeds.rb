
puts "Seeding Database..."
puts ''
puts 'Creating User Accounts...'

User.destroy_all

u1 = User.create! email: 'chris@ga.com', password: 'chicken', name: 'Chris', image: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
u2 = User.create! email: 'luke@ga.com', password: 'chicken', name: 'Luke', image: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
u3 = User.create! email: 'zara@ga.com', password: 'chicken', name: 'Zara', image: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'

puts "Created #{User.count} users: "
puts User.pluck(:name).join(', ')

puts ''
puts 'Creating Recipes...'

Recipe.destroy_all

r1 = Recipe.create!(
  title: "Chris's Burgers",
  method: 'Do this, do that, then do the third thing',
  like_count: 0,
  image: 'https://www.helpguide.org/wp-content/uploads/fast-foods-candy-cookies-pastries-768.jpg',
)

r2 = Recipe.create!(
  title: "Chris's Taco Supreme",
  method: "Taco taco, burrito burrito, taco taco. Even though I don't got a lot of money, I give you taco flavoured kisses honey. Fufill all your weeshes with my taco flavoured keeeeeseees",
  like_count: 0,
  image: 'https://images-gmi-pmc.edge-generalmills.com/e59f255c-7498-4b84-9c9d-e578bf5d88fc.jpg',
)

r3 = Recipe.create!(
  title: "Zara's Pizza",
  method: "I'll have mine p-p-p-pepperoni! I'll have mine vuh-vuh-vuh-vicodin!",
  like_count: 0,
  image: 'https://www.delonghi.com/Global/recipes/multifry/pizza_fresca.jpg',
)

#Associate recipes with users

u1.recipes << r1 << r2
u3.recipes << r3

puts "Created #{Recipe.count} recipes."
puts Recipe.pluck(:title).join(', ')
