class Api < Application
  def dispatch
    call = XMLRPC::Marshal.load_call(request.raw_post) 
    puts "***\n#{call.inspect}\n***" 
    method = call[0].gsub('.', '_')
    args = call[1]
    send(method, *args)
  end

  def metaWeblog_getCategories(blogid, username, password)
    categories = []
    XMLRPC::Marshal.dump_response(categories)
  end
  
  def metaWeblog_getRecentPosts(blogid, username, password, number_of_posts)
    posts = Post.find(:all, :order => "created_at DESC")
    XMLRPC::Marshal.dump_response(posts.map{|p| p.to_metaweblog })
  end
  
  def metaWeblog_getPost(postid, username, password)
    XMLRPC::Marshal.dump_response(Post.find(postid).to_metaweblog)
  end
  
  def metaWeblog_newPost(blogid, username, password, struct, publish)
    post = Post.create :author => username, :title => struct['title'], :description => struct['description']
    XMLRPC::Marshal.dump_response(post.to_param)
  end
  
  def metaWeblog_editPost(postid, username, password, struct, publish)
    post = Post.find(postid).update_attributes(:title => struct['title'], :description => struct['description'])
    XMLRPC::Marshal.dump_response(true)
  end

  def blogger_getUsersBlogs(appkey, username, password)
    blogs = [
      {:blogid => '1', :blogName => 'newminds blog', :url => '192.168.1.34:4000' }
    ]
    XMLRPC::Marshal.dump_response(blogs)
  end
  
  def blogger_deletePost(appkey, postid, username, password, publish)
    Post.find(postid).destroy  
    XMLRPC::Marshal.dump_response(true)
  end  
      
end
