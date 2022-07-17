class PostsController < ApplicationController
  before_action :set_date, only: [:index, :new, :show, :edit, :update]
  def index
    @posts = Post.all
    @date = Date.current.strftime("%Y年 %m月 %d日")
  end

  def new #新規登録画面
    @post = Post.new 
  end

  def create  #新規登録のアクション
    @post = Post.new(params.require(:post).permit(:title,:start,:fin,:all,:memo)) 
    if @post.save
      redirect_to posts_path
      flash[:notice] = "ユーザーを新規登録しました"
    else
      flash[:notice] = "登録に失敗しました"
      render "new"
    end
  end

  def show  #確認画面
    @post = Post.find(params[:id]) #Postの中の指定されたid属性をとる
  end

  def edit #編集画面
    @post = Post.find(params[:id])
  end

  def update #更新のアクション
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start,:fin,:all,:memo))
      redirect_to posts_path
      flash[:notice] = "[#{@post.id}]の情報を更新しました"
    else
      flash[:notice] = "更新に失敗しました"
      render "edit"
    end
  end

  def destroy #削除アクション
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to posts_path
  end

  private
  def set_date
    @date = Date.current.strftime("%Y年 %m月 %d日")
  end

end
