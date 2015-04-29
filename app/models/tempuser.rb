class Tempuser < ActiveRecord::Base
	has_many :comments
	before_create { generate_token(:auth_token) }
  
  def generate_token(column)
   begin
     self[column] = SecureRandom.urlsafe_base64
   end while Tempuser.exists?(column => self[column])
  end
  
  def like?(something)
    something.score.liker.include? pku_id
  end

  def like(something)
    @score = something.score
    @score.liker += [pku_id]
    @score.liker.uniq!
    @score.score = @score.generate_score
    @score.save
  end
  
  def unlike(something)
    @score = something.score
    @score.liker -= [pku_id]
    @score.liker.uniq!
    @score.score = @score.generate_score
    @score.save
  end

end
