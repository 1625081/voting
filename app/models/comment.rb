class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :image
  belongs_to :video
  belongs_to :music
  belongs_to :dmvideo
 
  belongs_to :tempuser
  belongs_to :user
end
