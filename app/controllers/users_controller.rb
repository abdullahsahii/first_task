class UsersController < ApplicationController
    
    def login
    end

    def log
        @email = User.find_by(email: params[:email])
        @password = User.find_by(password: params[:password])
        
        if(@email != nil && @password != nil)
            puts "Logged in Successfully"
            redirect_to root_path
        else
            puts "Wrong Email or Password"
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if (@user.password == @user.reenter_password)
           if @user.save
                redirect_to root_path
            else
                render :new
            end
        else
            puts "Password does not match....." 
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :reenter_password)
    end
    def login_params
        params.require(:login).permit(:email, :password)
    end
end
