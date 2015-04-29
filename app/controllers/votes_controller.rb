class VotesController < ApplicationController

 def create
  if params[:video_id]
  	@element = Video.find(params[:video_id])
  	@voter = User.where("pku_id = ?",vote_params[:pku_id]).last
  	@voter.like(@element)
  	@vote = @element.votes.create(vote_params)
  	respond_to do |f|
        f.js
     end
  end
 end

 def destroy
 	if params[:video_id]
      @element = Video.find(params[:video_id])
      @vote = @element.votes.find(params[:id])
      @voter = User.where("pku_id = ?",@vote.pku_id).last
  	  @voter.unlike(@element)
  	  @vote.destroy
  	  @element.save
      redirect_to timeline_path , notice: '投票已取消！'
    end
 end

 private
 	def vote_params
      params.require(:vote).permit(:video_id,:pku_id)
    end
end
