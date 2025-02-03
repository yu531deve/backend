class PostsController < ApplicationController
  # 投稿一覧の取得
  def index
    posts = Post.all
    render json: posts
  end

  # 投稿の作成
  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find(params[:id])
    render json: post
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: { message: "Post deleted successfully" }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end

  # ✅ **ここに `toggle_favorite` を移動**
  def toggle_favorite
    post = Post.find(params[:id])
    post.update!(is_favorite: params[:is_favorite]) # `!` をつけてエラー時に例外を投げる
    render json: post
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end


  private

  # Strong Parameters
  def post_params
    params.require(:post).permit(:title, :body, :is_favorite, :category, :salary)
  end


  # すべての投稿を削除
  def destroy_all
    Post.where(is_favorite: false).destroy_all # お気に入り以外の投稿のみ削除
    render json: { message: "Non-favorite posts deleted" }, status: :ok
  end
end
