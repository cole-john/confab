# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    # @user = User.find_by!(username: params.fetch(:id)) #! prevents passing nil forward and throwing 500 error
    @user = User.find_by!(username: params.fetch(:username))
  end

  def following
    @user = User.find_by!(username: params.fetch(:username))
  end

  def favorites
    @user = User.find_by!(username: params.fetch(:username))
  end
end
