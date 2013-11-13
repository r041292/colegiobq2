class EstrellaController < ApplicationController
	def update
		@colegio=Colegio.find(params[:id])
		Colegio.update(params[:id], :suma_rankin => @colegio.suma_rankin+params[:colegio][:suma_rankin].to_i, :numero_rankin => @colegio.numero_rankin+1)
		redirect_to @colegio
        
    end

end
