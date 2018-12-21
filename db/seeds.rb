Utilisateur.create!(nom: "toni69",
                    email: "admin@admin.fr",
                    password: "test69",
                    password_confirmation: "test69",
                    admin: true,
                    activated: true,
                    activated_at: Time.zone.now)

59.times do |n|
  nom = Faker::Name.name
  email = "example-#{n + 1}@marvel.com"
  password = "password"
  Utilisateur.create!(nom: nom,
                      email: email,
                      password: password,
                      password_confirmation: password,
                      activated: true,
                      activated_at: Time.zone.now)
end