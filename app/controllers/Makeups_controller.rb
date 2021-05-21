class MakeupsController < ApplicationController

    get '/makeups' do 


        #Index 
    # Make a get request to '/makeups'
        if logged_in?
          @makeups = Makeup.all
          erb :'makeups/index'
          else
              redirect '/login'
          end
      end


      #Show
      # Make a get request to `/makeups`

      get '/makeups/:makeup_id' do 
        if logged_in?
            #  binding.pry
            @makeup = Makeup.find_by_id(params[:makeup_id])
        #   @makeup_reviews = Review.where(makeup_id: @makeup.id)
            erb :'makeups/show'
        else
            redirect '/login'
        end
    end






end