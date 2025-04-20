# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.find_or_create_by!(email: "sakshishinde210403@gmail.com") do |user|
    user.full_name = "SDShinde"
    user.password = "sakshi"
    user.password_confirmation = "sakshi"
    user.role = :admin   # ← MUST be a symbol, not "admin"
    user.confirmed_at = Time.current
  end
  