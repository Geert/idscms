class Post < ActiveRecord::Base
  def permalink; "/posts/#{to_param}"; end
  def full_permalink; "http://192.168.1.34:4000#{permalink}"; end
  
  def to_metaweblog
    {
      :dateCreated => created_at,
      :userid => 1,
      :postid => id,
      :description => description,
      :title => title,
      :link => full_permalink,
      :permaLink => full_permalink,
      :categories => [ "category_1", "category_2" ],
      :date_created_gmt => created_at.getgm
    }
  end
end