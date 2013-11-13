class Colegio < ActiveRecord::Base

	def self.por_cercania(latitud, longitud)
		@colegios = Colegio.all
    distancia = 0.0
    tem=0
    @salida2=[]
    @colegios.each do |col|
      tem=0
      distancia =0
      tem=(latitud- col.latitud)**2 +(longitud - col.longitud)**2
      distancia = Math.sqrt(tem)
      if (distancia <= 0.00899928)
       @salida2 << col
     end
    end 
    return @salida2
	end

  
end
