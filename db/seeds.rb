
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
  description: 'A simple burger recipe',
  method: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  like_count: 0,
  image: 'https://www.helpguide.org/wp-content/uploads/fast-foods-candy-cookies-pastries-768.jpg',
)

r2 = Recipe.create!(
  title: "Chris's Taco Supreme",
  description: 'Super cool taco recipe',
  method: "Taco taco, burrito burrito, taco taco. Even though I don't got a lot of money, I give you taco flavoured kisses honey. Fufill all your weeshes with my taco flavoured keeeeeseees",
  like_count: 0,
  image: 'https://images-gmi-pmc.edge-generalmills.com/e59f255c-7498-4b84-9c9d-e578bf5d88fc.jpg',
)

r3 = Recipe.create!(
  title: "Zara's Pizza",
  description: 'Pepperoni pizza including how to make the dough from scratch',
  method: "I'll have mine p-p-p-pepperoni! I'll have mine vuh-vuh-vuh-vicodin!",
  like_count: 0,
  image: 'https://www.delonghi.com/Global/recipes/multifry/pizza_fresca.jpg',
)

#Associate recipes with users

u1.recipes << r1 << r2
u3.recipes << r3

puts "Created #{Recipe.count} recipes."
puts Recipe.pluck(:title).join(', ')


puts ''
puts 'Creating Comments...'

Comment.destroy_all

c1 = Comment.create!(
  comment: 'Looking good!',
  like_count: 0,
  image: '',
)

c2 = Comment.create!(
  comment: 'Meh.',
  like_count: 0,
  image: '',
)

c3 = Comment.create!(
  comment: 'This looks terrible.',
  like_count: 0,
  image: '',
)

c4 = Comment.create!(
  comment: 'Yum!',
  like_count: 0,
  image: '',
)

puts "Linking comments to recipes..."

r1.comments << c1 << c4
r2.comments << c2
r3.comments << c3

puts "Linking comments to users..."

u2.comments << c1 << c2
u3.comments << c3 << c4

puts "Created #{Comment.count} comments."


# Ingredients seeds below
Ingredient.destroy_all

puts 'Creating Ingredients....'
i1 = Ingredient.create!(product: 'Burger Patty')
i2 = Ingredient.create!(product: 'Burger Bun')
i3 = Ingredient.create!(product: 'Lettuce')
i4 = Ingredient.create!(product: 'Tomato Sauce')
i5 = Ingredient.create!(product: 'Milk')
i6 = Ingredient.create!(product: 'Flour')
i7 = Ingredient.create!(product: 'Toilet Paper')
i8 = Ingredient.create!(product: 'Toothpaste')

puts "Created #{Ingredient.count} ingredients"
puts Ingredient.pluck(:product).join(', ')

#Linking ingredients to recipe items

RecipeItem.destroy_all

ri1 = RecipeItem.create!(quantity: 1)
ri2 = RecipeItem.create!(quantity: 2)
ri3 = RecipeItem.create!(quantity: 100, unit: 'grams')
ri4 = RecipeItem.create!(quantity: 50, unit: 'ml')

i1.recipe_items << ri1
i2.recipe_items << ri2
i3.recipe_items << ri3
i4.recipe_items << ri4

#Linking recipe list to recipe

r1.recipe_items << ri1 << ri2 << ri3 << ri4


#shopping lists

puts ''
puts 'Creating Shopping Lists...'

ShoppingList.destroy_all

sl1 = ShoppingList.create!(name: 'Groceries')


puts "Created #{ShoppingList.count} shopping lists"
puts ShoppingList.pluck(:name).join(', ')

#User one gets the shopping list
u1.shopping_lists << sl1

puts "Creating Shopping List Items..."
sli1 = ShoppingListItem.create!(quantity: 2, unit: 'L')
sli2 = ShoppingListItem.create!(quantity: 500, unit: 'grams')
sli3 = ShoppingListItem.create!(quantity: 12, unit: '')
sli4 = ShoppingListItem.create!(quantity: 1, unit: '')

i5.shopping_list_items << sli1
i6.shopping_list_items << sli2
i7.shopping_list_items << sli3
i8.shopping_list_items << sli4

sl1.shopping_list_items << sli1 << sli2 << sli3 << sli4
