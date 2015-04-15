class TempusersController < ApplicationController
  before_action :set_tempuser, only: [:show, :edit, :update, :destroy]

  # GET /tempusers
  # GET /tempusers.json
  def index
    @tempusers = Tempuser.all
  end

  # GET /tempusers/1
  # GET /tempusers/1.json
  def show
  end

  # GET /tempusers/new
  def new
    @tempuser = Tempuser.new
  end

  # GET /tempusers/1/edit
  def edit
  end

  # POST /tempusers
  # POST /tempusers.json
  def create
    @tempuser = Tempuser.new(tempuser_params)

    respond_to do |format|
      if @tempuser.save
        format.html { redirect_to @tempuser, notice: 'Tempuser was successfully created.' }
        format.json { render :show, status: :created, location: @tempuser }
      else
        format.html { render :new }
        format.json { render json: @tempuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tempusers/1
  # PATCH/PUT /tempusers/1.json
  def update
    respond_to do |format|
      if @tempuser.update(tempuser_params)
        format.html { redirect_to @tempuser, notice: 'Tempuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @tempuser }
      else
        format.html { render :edit }
        format.json { render json: @tempuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tempusers/1
  # DELETE /tempusers/1.json
  def destroy
    @tempuser.destroy
    respond_to do |format|
      format.html { redirect_to tempusers_url, notice: 'Tempuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tempuser
      @tempuser = Tempuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tempuser_params
      params.require(:tempuser).permit(:pku_id)
    end
end
