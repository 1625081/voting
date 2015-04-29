class VotesController < ApplicationController

 def create
  if params[:video_id]
  	@element = Video.find(params[:video_id])
  	@voter = Tempuser.where("pku_id = ?",vote_params[:pku_id]).last
  	if @voter
      @voter.like(@element)
  	  @vote = @element.votes.create(vote_params)
  	   respond_to do |f|
         f.js
       end
     else
      redirect_to timeline_path , notice: '投票失败，错误未知！'
     end
  end
 end

 def destroy
 	if params[:video_id]
      @element = Video.find(params[:video_id])
      @vote = @element.votes.find(params[:id])
      @voter = Tempuser.where("pku_id = ?",@vote.pku_id).last
  	  if @voter 
       @voter.unlike(@element)
  	   @vote.destroy
  	   @element.save
       redirect_to timeline_path , notice: '投票已取消！'
      else
        redirect_to timeline_path , notice: '取消失败，错误未知！'
      end
  end
 end

 private
 	def vote_params
      params.require(:vote).permit(:video_id,:pku_id)
    end
end
