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
            @makeup = Makeup.find(params[:makeup_id])
            @error = "Data invalid. Please try agian"
            erb :'makeup/new' 
        end
    end

    get '/search' do
        if logged_in?
            erb :'makeup/search'
         else
          redirect '/login'
         end
    end

 
        post '/search' do
            if !params[:search].empty? #! Changed to .empty? rather than a presence. Empty string = true.
              @makeups = []
              Makeup.all.each { |m| @makeups << m if m.name.downcase.include?(params[:search].downcase) } #! Shovels into @makeups array if the string contains the value.
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
            #  binding.pry
            @makeup = Makeup.find_by_id(params[:id])
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
        @review = Review.find_by_id(params[:id])
        if !params["review"]["name"].empty? && !params["review"]["review"].empty? && params["review"]["rate"] !~ /\D/
        @review.update(params["review"])
        redirect "/makeup/#{@review.makeup_id}"
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