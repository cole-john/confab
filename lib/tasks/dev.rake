# frozen_string_literal: true

# if Rails.env.development?
require 'faker'

namespace :dev do
  desc 'Pre-populate the database with data for developing'
  task prime: :environment do
    starting = Time.now

    # Clean the dB
    TagJoin.delete_all
    Tag.delete_all
    Vote.delete_all
    Follow.delete_all
    Favorite.delete_all
    Reply.delete_all
    Post.delete_all
    User.delete_all

    # Create Users
    usernames = Array.new { Faker::Name.first_name }
    17.times do
      usernames << Faker::Name.first_name
    end

    usernames << 'alice'
    usernames << 'bob'
    usernames << 'cole'
    usernames.each do |username|
      User.create(
        email: "#{username}@example.com",
        username: username.downcase,
        password: 'password',
        avatar_img: "https://robohash.org/#{rand(9999)}?set=set5",
        bio: Faker::Hipster.paragraph,
        website: Faker::Internet.url(host: 'example.com')
      )
    end

    users = User.all

    # Create Posts for each User
    users.each do |user|
      rand(3).times do
        post = user.posts.create(
          title: Faker::Hipster.sentence,
          body: Faker::Hipster.paragraph(sentence_count: rand(3..10)),
          created_at: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now-1)
        )
      end
    end

    posts = Post.all

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
          author: User.all.sample,
          body: Faker::Movies::PrincessBride.quote,
          repliable_type: 'Post',
          repliable_id: post.id,
          created_at: Faker::Time.between(from: post.created_at, to: DateTime.now)
        )
      end
    end

    replies = Reply.all

    # Create Favorites for Posts
    posts.each do |post|
      next unless rand < 0.5

      favorite = post.favorites.create(
        user_id: User.all.sample.id,
        favoritable_type: 'Post',
        favoritable_id: post.id
      )
    end

    # Create Votes for Posts
    status = { down: 0, up: 1, star: 2 }

    posts.each do |post|
      next unless rand < 0.3

      vote = post.votes.create(
        user_id: User.all.sample.id,
        vote_status: status[status.keys.sample],
        votable_type: 'Post',
        votable_id: post.id
      )
    end

    # Create Tags and then connect to Posts
    15.times do
      Tag.create(name: Faker::Restaurant.type)
    end

    tags = Tag.all

    posts.each do |post|
      rand(1..2).times do
        TagJoin.create(
          tag_id: tags.sample.id,
          post_id: post.id
        )
      end
    end

    # Create Replies for Replies
    replies.each do |reply|
      rand(3).times do
        new_reply = if rand < 0.5
                      reply.replies.create(
                        author: User.all.sample,
                        body: Faker::TvShows::RickAndMorty.quote,
                        repliable_type: 'Reply',
                        repliable_id: reply.id,
                        parent_id: reply.id,
                        created_at: Faker::Time.between(from: reply.created_at, to: DateTime.now)
                      )
                    else
                      reply.replies.create(
                        author: User.all.sample,
                        body: Faker::TvShows::RickAndMorty.quote,
                        repliable_type: 'Reply',
                        repliable_id: reply.id,
                        parent_id: reply.id,
                        created_at: Faker::Time.between(from: reply.created_at, to: DateTime.now)
                      )
                    end
        next unless rand < 0.75

        another_reply = new_reply.replies.create(
          author: User.all.sample,
          body: Faker::TvShows::RickAndMorty.quote,
          repliable_type: 'Reply',
          repliable_id: new_reply.id,
          parent_id: new_reply.id,
          created_at: Faker::Time.between(from: new_reply.created_at, to: DateTime.now)
        )
      end
    end

    # Create Favorites for Replies
    replies.each do |reply|
      next unless rand < 0.5

      favorite = reply.favorites.create(
        user_id: User.all.sample.id,
        favoritable_type: 'Reply',
        favoritable_id: reply.id
      )
    end

    # Create Votes for Replies
    replies.each do |reply|
      next unless rand < 0.5

      vote = reply.votes.create(
        user_id: User.all.sample.id,
        vote_status: status[status.keys.sample],
        votable_type: 'Reply',
        votable_id: reply.id
      )
    end

    # Output results of the database priming
    ending = Time.now
    puts ' '
    puts "It took #{(ending - starting).to_i} seconds to create sample data."
    puts "There are now #{User.count} users."
    puts "There are now #{Post.count} posts."
    puts "There are now #{Reply.count} replies."
    puts "There are now #{Favorite.count} favorited posts or replies."
    puts "There are now #{Follow.count} posts with follows."
    puts "There are now #{Vote.count} posts or replies with votes."
    puts "There are now #{TagJoin.count} tags used on posts."
    puts ' '
  end
end
# end
