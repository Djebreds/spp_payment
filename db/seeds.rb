# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless Generation.any?
  Generation.create!([
    { years: "2018/2021" },
    { years: "2019/2022" },
    { years: "2020/2023" },
    { years: "2021/2024" },
    { years: "2022/2025" }
  ])
end

unless Major.any?
  Major.create!(name: "Rekayasa Perangkat Lunak", short: "RPL")
  Major.create!(name: "Teknik Komputer Jaringan", short: "TKJ")
  Major.create!(name: "Multimedia", short: "MM")
  Major.create!(name: "Elektronika", short: "EL")
  Major.create!(name: "Teknik Gambar Mesin", short: "TGM")
end

unless ClassRoom.any?
  ClassRoom.create!([
    { name: "XIII" },
    { name: "XII" },
    { name: "XI" },
    { name: "X" },
  ])
end

unless ClassMajor.any?
  ClassMajor.create!([
    { name: "XIII", class_room_id: 1, major_id: 1 },
    { name: "XIII", class_room_id: 1, major_id: 2 },
    { name: "XII", class_room_id: 2, major_id: 3 },
    { name: "XII", class_room_id: 2, major_id: 2 },
    { name: "XI", class_room_id: 3, major_id: 3 },
    { name: "XI", class_room_id: 3, major_id: 4 },
    { name: "X", class_room_id: 4, major_id: 4 },
    { name: "X", class_room_id: 4, major_id: 5 },
  ])
end

unless BudgetSpp.any?
  BudgetSpp.create!([
    { year: '2018', generation_id: 1},
    { year: '2019', generation_id: 1},
    { year: '2020', generation_id: 1},
    { year: '2019', generation_id: 2},
    { year: '2020', generation_id: 2},
    { year: '2021', generation_id: 2},
    { year: '2020', generation_id: 3},
    { year: '2021', generation_id: 3},
    { year: '2022', generation_id: 3}
    ])
  end
  
unless MonthlySpp.any?
  MonthlySpp.create!([
    { month: 'Januari', amount: 200000, budget_spp_id: 1 },
    { month: 'Februari', amount: 200000, budget_spp_id: 1 },
    { month: 'Maret', amount: 200000, budget_spp_id: 1 },
    { month: 'April', amount: 200000, budget_spp_id: 1 },
    { month: 'Mei', amount: 200000, budget_spp_id: 1 },
    { month: 'Juni', amount: 200000, budget_spp_id: 1 },
    { month: 'Juli', amount: 200000, budget_spp_id: 1 },
    { month: 'Agustus', amount: 200000, budget_spp_id: 1 },
    { month: 'September', amount: 200000, budget_spp_id: 1 },
    { month: 'Oktober', amount: 200000, budget_spp_id: 1 },
    { month: 'November', amount: 200000, budget_spp_id: 1 },
    { month: 'Desember', amount: 200000, budget_spp_id: 1 },
  ])
end

unless PaymentMethod.any?
  PaymentMethod.create!([
    { name: "Cash" },
    { name: "Online Payment" },
  ])
end

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
      class_major_id: 1, 
      generation_id: 1,
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

unless Payment.any?
    Payment.create!([
      { 
        payment_date: DateTime.now, 
        confirmation_date: DateTime.now,
        total: 200000, 
        status: :initial, 
        student_id: 1, 
        payment_methods_id: 1,
        budget_spps_id: 1, 
        admin_id: 1, 
        description: "Bayar SPP"
      }
    ])
end