# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
  end

  test 'creating a Post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Author', with: @post.author_id
    fill_in 'Body', with: @post.body
    fill_in 'Favorites count', with: @post.favorites_count
    fill_in 'Follows count', with: @post.follows_count
    fill_in 'Post type', with: @post.post_type
    fill_in 'Replies count', with: @post.replies_count
    fill_in 'Tags count', with: @post.tags_count
    fill_in 'Title', with: @post.title
    fill_in 'Votes count', with: @post.votes_count
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'updating a Post' do
    visit posts_url
    click_on 'Edit', match: :first

    fill_in 'Author', with: @post.author_id
    fill_in 'Body', with: @post.body
    fill_in 'Favorites count', with: @post.favorites_count
    fill_in 'Follows count', with: @post.follows_count
    fill_in 'Post type', with: @post.post_type
    fill_in 'Replies count', with: @post.replies_count
    fill_in 'Tags count', with: @post.tags_count
    fill_in 'Title', with: @post.title
    fill_in 'Votes count', with: @post.votes_count
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end
