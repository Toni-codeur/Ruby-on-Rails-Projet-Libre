Utilisateur.create!(nom: "admin",
                    email: "admin@admin.com",
                    password: "test69",
                    password_confirmation: "test69")

99.times do |n|
  nom = Faker::Name.name
  email = "example-#{n + 1}@marvel.com"
  password = "password"
  Utilisateur.create!(nom: nom,
                      email: email,
                      password: password,
                      password_confirmation: password)
end