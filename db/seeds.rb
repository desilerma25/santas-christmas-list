User.create(email: "justin@test.com", username: "Justin", password: "justin123")
Gift.create(title: "Blu Ray Movie", description: "The Crow with Brandon Lee", user_id: 1)
Gift.create(title: "Workout Equipment", description: "Cable machine", user_id: 1)

User.create(email: "benson@test.com", username: "Benson", password: "benson123")
Gift.create(title: "Toy", description: "Squeaky toy", user_id: 2)
Gift.create(title: "Treats", description: "Doggie treats", user_id: 2)

User.create(email: "desi@test.com", username: "Desi", password: "desi123")
Gift.create(title: "Gift Card", description: "To go to the movies", user_id: 3)
Gift.create(title: "Work Out Clothes", description: "Joggers in the color black", user_id: 3)

# run after deleting schema & dev.sqlite