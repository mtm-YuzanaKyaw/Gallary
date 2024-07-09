class PaintingsController < ApplicationController
  before_action :set_painting, only: %i[ show edit update destroy ]
  before_action :user_role, except: [:index, :show]

  # GET /paintings or /paintings.json
  def index
    @paintings = Painting.all.order('created_at DESC')
  end

  # GET /paintings/1 or /paintings/1.json
  def show
    @artist = Artist.find(@painting.artist_id)
  end

  # GET /paintings/new
  def new
    @painting = Painting.new
    @artists = Artist.all
  end

  # GET /paintings/1/edit
  def edit
    @artists =  Artist.all
  end

  def user_role
    redirect_to root_path, notice: "Not authorize to this route" if current_user.role == "user"
  end

  # POST /paintings or /paintings.json
  def create
    @painting = Painting.new(painting_params)

    respond_to do |format|
      if @painting.save
        format.html { redirect_to painting_url(@painting), notice: "Painting was successfully created." }
        format.json { render :show, status: :created, location: @painting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paintings/1 or /paintings/1.json
  def update
    respond_to do |format|
      if @painting.update(painting_params)
        format.html { redirect_to painting_url(@painting), notice: "Painting was successfully updated." }
        format.json { render :show, status: :ok, location: @painting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paintings/1 or /paintings/1.json
  def destroy
    @painting.destroy!

    respond_to do |format|
      format.html { redirect_to paintings_url, notice: "Painting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_painting
      @painting = Painting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def painting_params
      params.require(:painting).permit(:name, :description, :artist_id, :image)
    end
end
