class CitiesController < ApplicationController

  def index
    @cities = City.all
  end


def update_temp
    city = City.find(params[:id])

    response = RestClient.get "http://v.juhe.cn/weather/index",
                              :params => { :cityname => city.juhe_id, :key => "ad0c4da70d1281c49020e179e18a077c" }
    data = JSON.parse(response.body)

    city.update( :current_temp => data["result"]["sk"]["temp"] )

    redirect_to cities_path
end


def update_wind_direction
    city = City.find(params[:id])

    response = RestClient.get "http://v.juhe.cn/weather/index",
                              :params => { :cityname => city.juhe_id, :key => "ad0c4da70d1281c49020e179e18a077c" }
    data = JSON.parse(response.body)

    city.update( :wind_direction  => data["result"]["sk"]["wind_direction"] )

    redirect_to cities_path
end


def update_wind_strength
    city = City.find(params[:id])

    response = RestClient.get "http://v.juhe.cn/weather/index",
                              :params => { :cityname => city.juhe_id, :key => "ad0c4da70d1281c49020e179e18a077c" }
    data = JSON.parse(response.body)

    city.update( :wind_strength => data["result"]["sk"]["wind_strength"] )

    redirect_to cities_path
end

end
