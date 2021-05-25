if Rails.env.development?
require 'faker'

desc "Sample data for local development environment"
  task prime: "db:setup" do
    starting = Time.now

    # Clean the dB
    Tag.delete_all
    Vote.delete_all
    Follow.delete_all
    Favorite.delete_all
    Reply.delete_all
    Post.delete_all
    User.delete_all


    # Create Users
    usernames = Array.new {Faker::Name.first_name}
    12.times do
      usernames << Faker::Name.first_name
    end
    
    usernames << "alice"
    usernames << "bob"
    usernames << "cole"
    usernames.each do |username|
      User.create(
        email: "#{username}@example.com",
        username: username.downcase,
        password: "password",
        avatar_img: "https://robohash.org/#{rand(9999)}",
        bio: Faker::Hipster.paragraph ,
        website: Faker::Internet.url(host: 'example.com')
      )
    end

    users = User.all

    # Create Posts for each User
    users.each do |user|
      rand(10).times do
        post = user.posts.create(
          title: Faker::Hipster.sentence,
          body: Faker::Hipster.paragraphs(number: rand(3))
        )
      end
    end

    posts = Post.all
    
    test_user = users.sample
    p "Username: #{test_user.username} and ID: #{test_user.id}"

    # Create Follows for Posts
    posts.each do |post|
      rand(10).times do
        follow = post.follows.create(
          user_id: users.sample.id
        )
      end
    end
    
    # Create Replies for Posts


    # Create Favorites for Posts


    # Create Votes for Posts


    # Create Tags for Posts

    

    # Create Replies for Replies

    # Create Favorites for Replies

    # Create Votes for Replies


    
    
    ending = Time.now
    p "It took #{(ending - starting).to_i} seconds to create sample data."
    p "There are now #{User.count} users."
    p "There are now #{Post.count} posts."
    p "There are now #{Reply.count} replies."
    p "There are now #{Favorite.count} favorited posts or replies."
    p "There are now #{Follow.count} follows posts or replies."
    p "There are now #{Vote.count} posts or replies with votes."
    p "There are now #{TagJoin.count} tags used on posts."

  end
end
