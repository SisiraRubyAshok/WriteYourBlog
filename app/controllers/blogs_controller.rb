class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    blogs = Blog.published
    if params[:type].eql?("latest")
      blogs = blogs.order(created_at: :desc)
    elsif params[:type].eql?("top")
      blogs
    end
    @pagy,@blogs = pagy_countless(blogs)
    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
    
  end

  def my_blogs
    @pagy, @blogs = pagy(current_user.blogs)
  end
  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
      if params[:publish_state].eql?("Published")
        @blog.post = 1
      end
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    if params[:publish_state].eql?("Published")
        @blog.post = 1
    end
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :user_id)
    end

    def find_current_user
      @user= current_user
    end
end
