namespace :lzh do
  desc "make users"
  task users: :environment do
    make_users
  end
end
def make_users
  admin = User.create!(name:     "lzh",
                       email:    "admin@admin.com",
                       password: "123456",
                       password_confirmation: "123456",
                       mobile: 18019951766)
  20.times do |n|
    name  = Faker::Name.name
    email = "#{n}@#{n}.com"
    password  = "123456"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password,
                 mobile: 18088888000+n)
  end
end
namespace :lzh do
  desc "make some cars sample"
  task cars: :environment do
    make_cars
  end
end
def make_cars
  users = User.all
  2.times do
    users.each { |user| user.cars.create!(
                          description: "pretty good",
                          band: "路虎",
                          price: 231,
                          city: "合肥",
                          location: "龙居山庄")}
  end
end

namespace :lzh do
  desc "make some infos sample"
  task infos: :environment do
    make_infos
  end
end
def make_infos
  cars = Car.all
  cars.each { |car| car.infos.create!(
                        rent_start: "2013-8-3",
                        rent_end: "2013-8-4") }
end

namespace :lzh do
  desc "make some comments"
  task comments: :environment do
    make_comments
  end
end
def make_comments
  cars = Car.all
  cars.each do |car|
    5.times do
      car.comments.create!(content: "pretty good")
    end
  end
  comments = Comment.all
  comments.each do |comment| 
    comment.user_id = 3 
    comment.save
  end
end