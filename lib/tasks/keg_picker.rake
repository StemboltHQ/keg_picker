namespace :keg_picker do
  namespace :bootstrap do
    require "factory_girl_rails"

    desc "Create users"
    task users: :environment do
      FactoryGirl.create_list :user, 14
      FactoryGirl.create :admin
    end

    desc "Create beers"
    task beers: :environment do
      FactoryGirl.create_list :beer, 8
    end

    desc "Create polls"
    task polls: :environment do
      FactoryGirl.create_list :poll, 5
    end

    desc "Add votes to polls"
    task simulate_voting: :environment do
      1.upto(5).each do |n|
        User.find_each do |user|
          Ballot.create user_id: user.id, beer_id: rand(1..8), poll_id: n
        end

        # Finalize all but the last poll
        Poll.find(n).finalize unless n == 5
      end
    end

    desc "Run all bootstrapping tasks"
    task all: [:users, :beers, :polls, :simulate_voting]
  end
end
