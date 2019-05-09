# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if ! User.find_by(username: 'admin')
  admin = User.new
  admin.username = 'admin'
  admin.email = "admin@#{Settings.domain}"
  admin.password = Rails.application.credentials.dig(:admin, :password)
  admin.password_confirmation = Rails.application.credentials.dig(:admin, :password)
  admin.admin = true
  admin.skip_confirmation!
  admin.save!
end
