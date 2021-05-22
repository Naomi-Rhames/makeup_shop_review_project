class ReviewsController < ApplicationController

    #Create
 
 
    # New 
   #Make a post request 
   get '/makeups/:makeup_id/reviews/new' do 
    if logged_in?
        @makeup = Makeup.find(params[:makeup_id])
        erb :'makeups/new'
    else
        redirect '/login'
         end
    end

    #Create
    # make a review request to '/makeup'
    post '/makeups/:makeup_id/reviews' do
       @review = Review.new(params)
       @review.user_id = current_user.id
       if !@review.name.empty? && !@review.review.empty?
            @review.save
          redirect '/makeups'
        else
            @makeup = Makeup.find(params[:makeup_id])
            @error = "Data invalid. Please try agian"
            erb :'makeups/new' 
        end
    end

    get '/search' do
        if logged_in?
            erb :'makeups/search'
         else
          redirect '/login'
         end
    end

 
        post '/search' do
            if !params[:search].empty? #! Changed to .empty? rather than a presence. Empty string = true.
              @makeups = []
              Makeup.all.each { |m| @makeups << m if m.name.downcase.include?(params[:search].downcase) } #! Shovels into @makeups array if the string contains the value.
              erb :'makeups/search'
            else
              @makeups = Makeup.all
              erb :'makeups/search'
            end
            erb :'makeups/search'
          end
    
 
    #Update

    #Edit
    #Make a get request to '/review/:id/edit'
    get '/makeups/:makeup_id/reviews/:id/edit' do
        if logged_in?
        @review = Review.find_by_id(params[:id])
        erb :'/makeups/edit'
    
        else
            redirect '/login'
        end
    end

    #Update
    #Make a patch request to '/review/:id'
      patch '/makeups/:makeup_id/reviews/:id' do
        @review = Review.find_by_id(params[:id])
        if !params["review"]["name"].empty? && !params["review"]["review"].empty? && params["review"]["rate"] !~ /\D/
        @review.update(params["review"])
        redirect "/makeups/#{@review.makeup_id}"
      else
              @error = "Data invalid. Please try agian"  
              erb :'makeups/edit' 
                end
        end

        
    #Destroy 

    # make a delete request 'review/:id
    delete '/makeups/:makeup_id/reviews/:id' do 
        @review = Review.find_by_id(params[:id])
        @review.destroy
        redirect '/makeups'
    end
    
end 