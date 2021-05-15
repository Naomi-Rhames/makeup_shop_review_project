 class UsersController < ApplicationController

        # users can sign-up
        get '/signup' do
            erb :'users/signup' 
        end

        post '/signup' do
            # users should not be able to create a account with any blank credentials
            # users should not be able to creatw with a username that already exists
             user = User.new(params)
            if user.save
                session[:user_id] = user.id
                redirect '/makeup'
            else
                @error = "Invalid credentials"
                erb :'/users/signup'
            end
        end
 end