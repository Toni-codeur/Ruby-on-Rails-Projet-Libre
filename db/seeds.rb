Utilisateur.create!(nom: "Toni",
                    email: "jonathan.grondin@yahoo.fr",
                    password: "test69",
                    password_confirmation: "test69",
                    admin: true,
                    activated: true,
                    activated_at: Time.zone.now)

59.times do |n|
  nom = Faker::Name.name
  email = "example-#{n + 1}@getcodingknowledge.com"
  password = "password"
  Utilisateur.create!(nom: nom,
                      email: email,
                      password: password,
                      password_confirmation: password,
                      activated: true,
                      activated_at: Time.zone.now)
end
