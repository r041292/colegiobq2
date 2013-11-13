
class ColegiosController < ApplicationController
  before_action :set_colegio, only: [:show, :edit, :update, :destroy]

  def index
  end

  def ravanzada
    if params[:all].to_s =="1"
      @salida=Colegio.all
    else
      query="SELECT * FROM colegios WHERE "
      temp=Array.new
      unless params[:query][:nombre].empty?
        temp<<"nombre like '%"+params[:query][:nombre]+"%'"
      end
      unless params[:query][:estrato].empty?
        temp<<"estrato = '"+params[:query][:estrato]+"'"
      end
      unless params[:query][:enfasis].empty?
        temp<<"enfasis = '"+params[:query][:enfasis]+"'"
      end
      unless params[:query][:nivel_icfes].empty?
        temp<<"nivel_icfes = '"+params[:query][:nivel_icfes]+"'"
      end
      for i in(1..temp.length) do
        if i==temp.length
          query=query + temp[i-1] 
        else
          query= query+ temp[i-1]+ " and "
        end
      end
      @salida=Colegio.find_by_sql(query)
      unless params[:query][:latitude].empty?
        @salida2=Colegio.por_cercania(params[:query][:latitude].to_f,params[:query][:longitude].to_f)
        @salida=@salida & @salida2
      end
    end 

    @salida2=''

    @salida.each do |col|
        @salida2=@salida2+col.nombre+','+col.latitud.to_s+','+col.longitud.to_s+';'
    end
  end

  def result
    @salida=''
    @salida2=Colegio.por_cercania(params[:query][:latitude].to_f,params[:query][:longitude].to_f)
    @salida2.each do |col|
        @salida =@salida+col.nombre+','+col.latitud.to_s+','+col.longitud.to_s+';'
    end
  end
 
  def show
  end

  def new
    @colegio = Colegio.new
  end

  def edit
  end

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

  def destroy
    @colegio.destroy
    respond_to do |format|
      format.html { redirect_to colegios_url }
      format.json { head :no_content }
    end
  end

  private
   
    def set_colegio
      @colegio = Colegio.find(params[:id])
    end

    def colegio_params
      params.require(:colegio).permit(:nombre, :direccion, :nivel_icfes, :estrato, :enfasis, :latitud, :longitud, :suma_rankin, :numero_rankin)
    end
end
