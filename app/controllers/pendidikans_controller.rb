class PendidikansController < ApplicationController
  before_filter :admin_user
  before_action :set_pendidikan, only: [:show, :edit, :update, :destroy]

  # GET /pendidikans
  # GET /pendidikans.json
  def index
    @pendidikans = Pendidikan.paginate(page: params[:page],:per_page => 10)
  end

  # GET /pendidikans/1
  # GET /pendidikans/1.json
  def show
  end

  # GET /pendidikans/new
  def new
    @pendidikan = Pendidikan.new
  end

  # GET /pendidikans/1/edit
  def edit
  end

  # POST /pendidikans
  # POST /pendidikans.json
  def create
    @pendidikan = Pendidikan.new(pendidikan_params)

    respond_to do |format|
      if @pendidikan.save
        format.html { redirect_to @pendidikan, notice: 'Pendidikan was successfully created.' }
        format.json { render :show, status: :created, location: @pendidikan }
      else
        format.html { render :new }
        format.json { render json: @pendidikan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pendidikans/1
  # PATCH/PUT /pendidikans/1.json
  def update
    respond_to do |format|
      if @pendidikan.update(pendidikan_params)
        format.html { redirect_to @pendidikan, notice: 'Pendidikan was successfully updated.' }
        format.json { render :show, status: :ok, location: @pendidikan }
      else
        format.html { render :edit }
        format.json { render json: @pendidikan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pendidikans/1
  # DELETE /pendidikans/1.json
  def destroy
    @pendidikan.destroy
    respond_to do |format|
      format.html { redirect_to pendidikans_url, notice: 'Pendidikan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pendidikan
      @pendidikan = Pendidikan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pendidikan_params
      params.require(:pendidikan).permit(:level_pend)
    end
    
    def admin_user
      authenticate_user!
      redirect_to(root_url) unless current_user.admin?
    end
end
