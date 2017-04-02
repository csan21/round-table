Game.destroy_all
User.destroy_all
Revision.destroy_all

user = User.create!(username: "NickDevlin", email: "nick@devlins.gov", password: "opensource!")

50.times do
  game_info = { name: Faker::Lorem.words(3).join(' '),
              description: Faker::Lorem.paragraph,
              creator: user }
  Game.create!(game_info)
end

Game.all.each do |game|
  revision_info = { name: Faker::Lorem.words(3).join(' '),
                    description: Faker::Lorem.paragraph,
                    collaborator: user
                  }
  game.revisions << Revision.new(revision_info)
  game.save!
end

user2 = User.create!(username: "NickDevlin2", email: "nick2@devlins.gov", password: "opensource!")
user3 = User.create!(username: "NickDevlin3", email: "nick3@devlins.gov", password: "opensource!")
user4 = User.create!(username: "NickDevlin4", email: "nick4@devlins.gov", password: "opensource!")

game = Game.first
game.revisions << Revision.new(name: "Lorem ipsum",
              description: "Lorem ipsum dolor sit amet,",
              collaborator: user2)
game.save!
game.revisions << Revision.new(name: "Lorem ipsum hi",
              description: "Lorem ipsum dolor sit amet, hi",
              collaborator: user3)
game.save!
game.revisions << Revision.new(name: "Lorem ipsum hasdfai",
              description: "Lorem ipsum dolor sit amet, hafdasfasdfasi")
game.save!
game.revisions << Revision.new(name: "Lorem ipsum hasdfi",
              description: "Lorem ipsum dolor sit amet, hiol")
game.save!
game.revisions << Revision.new(name: "Lorem ipsum hello",
              description: "Lorem ipsum dolor sit amet, bye",
              collaborator: user4)
game.save!
game.revisions << Revision.new(name: " ipsum hello",
              description: "Lorem ipsum dolor sit amet, bye",
              collaborator: user)
game.save!
game.revisions << Revision.new(name: "Lorem ipsum hello",
              description: "Lorem  dolor sit amet, bye",
              collaborator: user)
game.save!
