
puts "Seeding Database..."
puts ''
puts 'Creating User Accounts...'

User.destroy_all

u1 = User.create! email: 'chris@ga.com', password: 'chicken', name: 'Chris', image: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
u2 = User.create! email: 'luke@ga.com', password: 'chicken', name: 'Luke', image: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
u3 = User.create! email: 'zara@ga.com', password: 'chicken', name: 'Zara', image: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'

puts "Created #{User.count} users: "
puts User.pluck(:name).join(', ')
