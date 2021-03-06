class Dmvideo < ActiveRecord::Base
  mount_uploader :cover, ThumbUploader
  has_one :score
  has_one :thumb
  belongs_to :user
  
  after_create do
    self.score = Score.new liker: [], favor: [], viewer: 0, editor_rec: []
    self.score.save
  end
  
  def mo_item
    {
      :thumb => cover.url,
      :title => title,
      :sub_title => des.gsub(/<\/?.*?>/,""),
      :author => {
        :avatar => User.find(user_id).avatar,
        :username => User.find(user_id).nickname
      },
      :score => {
        :like => score.liker.size,
        :favor => score.favor.size,
        :favors => score.favor,
        :rate => score.generate_score
      },
      :url => {
        :show => "/dmvideos/#{id}"
      }
    }
  end




end
