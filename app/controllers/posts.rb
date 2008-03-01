class Posts < Application
  
  def index
    @posts = Post.find(:all)
    render
  end
  
end
