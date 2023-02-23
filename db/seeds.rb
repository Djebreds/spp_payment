# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless Student.any?
  Student.create!([
    { 
      email: "student@sppayment.com", 
      password: "1234567890", 
      name: "Student", 
      nisn: "1234567890", 
      nis: "123456789",
      phone: "6282121491054", 
      status: :active, 
      address: "Jl. Soreang Cipatik"
    }
  ])
end

unless Admin.find_by(email: "admin@sppayment.com").present?
  Admin.create!(
    email: "admin@sppayment.com", 
    password: "1234567890", 
    name: "Administrator", 
    nip: "0987654321", 
    roles: :admin,
    address: "Jl. Soreang Cipatik",
    phone: "6282121491054",
    status: :active
    );
    
  Admin.create!(
    email: "staff@sppayment.com", 
    password: "1234567890", 
    name: "Staff", 
    nip: "0987651234", 
    roles: :staff,
    address: "Jl. Soreang Cipatik",
    phone: "628547226035",
    status: :active
    );  
end