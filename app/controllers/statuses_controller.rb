class StatusesController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_filter :authenticate_user!, only: [:new, :create]
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  # GET /statuses.json
  def index
    # @statuses = Status.all
     @statuses = Status.order('created_at DESC').page(params[:page]).per(4)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)
    @status.photos = params[:photos]

      if @status.save
        redirect_to @status
      else
        render :new
      end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update

    @status.update(status_params)
    @status.photos = params[:photos]

    if @status.save
        redirect_to @status
      else
        render :edit
      end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:user_id, :contenido, :imagen, :photos)
    end
end
