class HomeController < ApplicationController
  def index
    
  end
  
  def test
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def timeline
    if current_user
      if current_user.is_verify?

      else
        respond_to do |format|
          format.html{
           redirect_to home_path , notice:"请先完成认证再来投票哦～"
         }
        end
      end
    else
      respond_to do |format|
        format.html{
          redirect_to home_path , notice:"请先完成认证再来投票哦～"
        }
      end
    end

    if params[:search]
      @sitems = []
      @items = []
      @sitems += Video.all
      for sitem in @sitems 
        msplit = sitem.title.split(params[:search],2) 
        if msplit[0] !=  sitem.title
            if sitem.mo_item[:class] == "Video" 
              @items += Video.where("title = ?",sitem.title)
            end
        end
      end 
    else
      @items = []
      @items += Video.all
    end
  end

  def video
  end

end
