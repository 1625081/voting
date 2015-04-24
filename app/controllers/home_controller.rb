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
      if current_user.is_verify? || current_user.power == "admin"
         @secret = Digest::MD5.hexdigest(Digest::SHA1.hexdigest(Base64::encode64(Rails.application.secrets.angular_secret)))
      else
        respond_to do |format|
          format.html{
           redirect_to home_path , notice:"请先完成认证再来投票哦～"
         }
        end
      end
    elsif session[:cas_user]
       @secret = Digest::MD5.hexdigest(Digest::SHA1.hexdigest(Base64::encode64(Rails.application.secrets.angular_secret)))
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
      @current_items = @items.sort{|e,f| e.mo_item[:score][:like] <=> f.mo_item[:score][:like]}.reverse 
    else
      @items = []
      @items += Video.all
      @current_items = @items.sort{|e,f| e.mo_item[:score][:like] <=> f.mo_item[:score][:like]}.reverse
    end
  end

  def video
  end

end
