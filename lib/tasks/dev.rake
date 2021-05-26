if Rails.env.development?
require 'faker'

  namespace :dev do
    desc "Pre-populate the database with data for developing"
    task prime: :environment do
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
      17.times do
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
        rand(3).times do
          post = user.posts.create(
            title: Faker::Hipster.sentence,
            body: Faker::Hipster.paragraph(sentence_count: rand(1..3))
          )
        end
      end

      posts = Post.all
      
    # test_user = users.sample
    # p "Username: #{test_user.username} and ID: #{test_user.id}"

      # Create Follows for Posts
      posts.each do |post|
        rand(3).times do
          follow = post.follows.create(
            user_id: users.sample.id
          )
        end
      end
      
      # Create Replies for Posts
      posts.each do |post|
        rand(3).times do
          reply = post.replies.create(
            author_id: User.all.sample.id,
            body: Faker::Quote.famous_last_words,
            repliable_type: "Post"
          )
        end
      end

      replies = Reply.all

      # Create Favorites for Posts
      posts.each do |post|
        if rand < 0.5
          favorite = post.favorites.create(
            user_id: User.all.sample.id,
            favoritable_type: "Post"
          )
        end
      end

      # Create Votes for Posts
      status = { down: 0, up: 1, star: 2 }

      posts.each do |post|
        if rand < 0.3
          vote = post.votes.create(
            user_id: User.all.sample.id,
            vote_status: status[status.keys.sample],
            votable_type: "Post"
          )
        end
      end

      # Create Tags and then connect to Posts
      10.times do
        Tag.create(name: Faker::Restaurant.type)
      end
      tags = Tag.all
      posts.each do |post|
        tag = 

      end
      
    

      # Create Replies for Replies
      replies.each do |reply|
        rand(3).times do
          if rand < 0.5
            new_reply = reply.replies.create(
              author_id: User.all.sample.id,
              body: Faker::Hacker.say_something_smart,
              repliable_type: "Reply",
            )
          else
              new_reply = reply.replies.create(
                author_id: User.all.sample.id,
                body: Faker::TvShows::RickAndMorty.quote,
                repliable_type: "Reply",
              )
          end
        end
      end


      # Create Favorites for Replies
      replies.each do |reply|
        if rand < 0.5
          favorite = reply.favorites.create(
            user_id: User.all.sample.id,
            favoritable_type: "Reply"
          )
        end
      end

      # Create Votes for Replies
      replies.each do |reply|
        if rand < 0.5
          vote = reply.votes.create(
            user_id: User.all.sample.id,
            vote_status: status[status.keys.sample],
            votable_type: "Reply"
          )
        end
      end
      
      # Output results of the database priming
      ending = Time.now
      puts " "
      puts "It took #{(ending - starting).to_i} seconds to create sample data."
      puts "There are now #{User.count} users."
      puts "There are now #{Post.count} posts."
      puts "There are now #{Reply.count} replies."
      puts "There are now #{Favorite.count} favorited posts or replies."
      puts "There are now #{Follow.count} posts with follows."
      puts "There are now #{Vote.count} posts or replies with votes."
      puts "There are now #{TagJoin.count} tags used on posts."
      puts " "
    end
  end
end
