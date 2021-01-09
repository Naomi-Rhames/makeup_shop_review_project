class ReviewController < ApplicationController

    #Create

 
    # New 
    # make a get makeeup to '/makeup/review
    get '/makeup/review' do
        erb :'makeup/review'
    end

    #Create
    # make a review request to '/makeup'
    post '/review' do
        review = Review.new(params)
        if  review.save
          redirect '/makeup'
        else
            @error = "Data invalid. Please try agian"
            erb :'makeup/review' 
        end
    end
    #Read

    #Index
    # Make a get request to '/makeup'

    get '/makeup' do
        @makeups = Makeup.all
        erb :'makeup/index'
    end


    #Show
    #Make a get request to get '/Makeup/:id'
   
   
    get '/makeup/:id' do
        @makeup = Makeup.find(params["id"] )
        erb :'makeup/show'
    end
 
    #Update

    #Edit
    #Make a get request to '/review/:id/edit'
    # get '/review/:id/edit' do
    #     @review = Review.find(params["id"])
    #     erb: '/review/edit'
    # end

    #Update
    #Make a patch request to '/review/:id'

    #Destroy

    # make a delete request 'review/:id

end