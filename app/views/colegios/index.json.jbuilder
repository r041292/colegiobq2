json.array!(@colegios) do |colegio|
  json.extract! colegio, :nombre, :direccion, :nivel_icfes, :estrato, :enfasis, :latitud, :longitud, :suma_rankin, :numero_rankin
  json.url colegio_url(colegio, format: :json)
end
