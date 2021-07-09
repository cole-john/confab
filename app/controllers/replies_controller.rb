# frozen_string_literal: true

class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: %i[show edit update destroy]

  # GET /replies or /replies.json
  def index
    @replies = Reply.all.order("created_at DESC")
  end

  # GET /replies/1 or /replies/1.json
  def show; end

  # GET /replies/new
  def new

    @reply = Reply.new(
      author: current_user,
      body: ''
    )
    if params.key?(:post_id)
      @parent_id = params[:post_id]
      @parent_type = 'post'
      @reply.author = current_user
      @reply.repliable_id = params[:post_id]
      @reply.repliable_type = 'Post'
    else
      @parent_id = Reply.find(params[:reply_id]).repliable_id
      @parent_type = Reply.find(params[:reply_id]).repliable_type.downcase
      @reply.repliable_id = params[:reply_id]
      @reply.repliable_type = 'Reply'
      @reply.parent_id = params[:reply_id]
    end

    respond_to do |format|
      format.js { render template: 'replies/new_reply.js' }
    end
  end

  # GET /replies/1/edit
  def edit; end

  # POST /replies or /replies.json
  def create
    @reply = Reply.new(reply_params)
    @reply.author_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
        format.js { render template: 'replies/create.js.erb' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reply_params
    params.require(:reply).permit(:post_id, :body, :repliable_id, :repliable_type, :parent_id)
  end
end
