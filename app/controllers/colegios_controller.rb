
class ColegiosController < ApplicationController
  before_action :set_colegio, only: [:show, :edit, :update, :destroy]

  # GET /colegios
  # GET /colegios.json
  def index
  end

  def result
    @colegios = Colegio.all
    distancia = 0.0
    tem=0
    @salida=''
    @salida2=[]
    @colegios.each do |col|
      tem=0
      distancia =0
      tem=(params[:query][:latitude].to_f - col.latitud)**2 +(params[:query][:longitude].to_f - col.longitud)**2
      distancia = Math.sqrt(tem)
      if (distancia <= 0.00899928)
       @salida =@salida+col.nombre+','+col.latitud.to_s+','+col.longitud.to_s+';'
       @salida2 << col
     end
    end
    @salida 
    @salida2
  end
  

  # GET /colegios/1
  # GET /colegios/1.json
  def show
  end

  # GET /colegios/new
  def new
    @colegio = Colegio.new
  end

  # GET /colegios/1/edit
  def edit
  end

  # POST /colegios
  # POST /colegios.json
  def create
    @colegio = Colegio.new(colegio_params)
      respond_to do |format|
      if @colegio.save
        format.html { redirect_to @colegio, notice: 'Colegio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @colegio }
      else
        format.html { render action: 'new' }
        format.json { render json: @colegio.errors, status: :unprocessable_entity }
      end
    end
 
  end

  # PATCH/PUT /colegios/1
  # PATCH/PUT /colegios/1.json
  def update
    respond_to do |format|
      if @colegio.update(colegio_params)
        format.html { redirect_to @colegio, notice: 'Colegio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @colegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colegios/1
  # DELETE /colegios/1.json
  def destroy
    @colegio.destroy
    respond_to do |format|
      format.html { redirect_to colegios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colegio
      @colegio = Colegio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colegio_params
      params.require(:colegio).permit(:nombre, :direccion, :nivel_icfes, :estrato, :enfasis, :latitud, :longitud, :suma_rankin, :numero_rankin)
    end
end
