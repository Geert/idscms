class Post < ActiveRecord::Base
  def permalink; "/posts/#{to_param}"; end
  def full_permalink(host); "http://#{host}#{permalink}"; end
  
  def to_metaweblog(options = {})
    {
      :dateCreated => created_at,
      :userid => 1,
      :postid => id,
      :description => description,
      :title => title,
      :link => full_permalink(options[:host]),
      :permaLink => full_permalink(options[:host]),
      :categories => [ "category_1", "category_2" ],
      :date_created_gmt => created_at.getgm
    }
  end
end