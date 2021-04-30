class ReviewController < ApplicationController

    #Create
 
 
    # New 
   #Make a post request
   get '/review/:id' do 
    if logged_in?
        @makeup = Makeup.find(params[:id])
        erb :'makeup/new'
    else
        redirect '/login'
         end
    end
    #Create
    # make a review request to '/makeup'
    post '/review' do
        filltered_params = params.reject{|key, value| key == "image" && value.empty?}
       @review = Review.new(params)
       @review.user_id = current_user.id
       if !@review.name.empty? && !@review.review.empty?
            @review.save
          redirect '/makeup'
        else
            @error = "Data invalid. Please try agian"
            erb :'makeup/review' 
        end
    end

    get '/search' do
        if logged_in?
          @makeups = Makeup.all
            if params[:search]
                  @makeups = Makeup.search(params[:search])
            else
             @makeups = Makeup.all
             end
            erb :'makeup/search'
         else
            @error = "Sorry Can't find what your looking for..."
         end
    end

 
    post '/search' do
        #  binding.pry
        if params[:search]
          @makeups = Makeup.find_by(name: params[:search])
          erb :'makeup/search'
        else
          @makeups = Makeup.all
          erb :'makeup/search'
        end
        erb :'makeup/search'
      end
    #Read

    #Index 
    # Make a get request to '/makeup'

    get '/makeup' do 
      if logged_in?
        @makeups = Makeup.all
        erb :'makeup/index'
        else
            redirect '/login'
        end
    end


    #Show
    #Make a get request to get '/Makeup/:id'
   
   
    get '/makeup/:id' do 
        if logged_in?
            @makeup = Makeup.find_by(params[:id])
            @makeup_reviews = Review.where(makeup_id: @makeup.id)
            erb :'makeup/show'
        else
            redirect '/login'
        end
    end
 
    #Update

    #Edit
    #Make a get request to '/review/:id/edit'
    get '/review/:id/edit' do
        if logged_in?
        @review = Review.find(params[:id])
        erb :'/makeup/edit'
        else
            redirect '/login'
        end
    end

    #Update
    #Make a patch request to '/review/:id'
      patch '/review/:id' do
        @review = Review.find_by(params[:id])
        if !params["review"]["name"].empty? && !params["review"]["review"].empty? && params["review"]["rate"] !~ /\D/
        @review.update(params["review"])
        redirect "/makeup/#{params[:id]}"
      else
              @error = "Data invalid. Please try agian"  
              erb :'makeup/edit' 
                end
        end

        
    #Destroy 

    # make a delete request 'review/:id
    delete '/review/:id' do 
        @review = Review.find_by(params[:id])
        @review.destroy
        redirect '/makeup'
    end



end 