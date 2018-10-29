class SessionsController < ApplicationController
  def new
    @user = User.find_by(email: params['email'])
    if @user && @user.authenticate(params['password'])
      session[:user_id] = @user.id
      render 'welcome/home'
    else
      flash.now.alert = "Incorrect email or password, try again."
      render 'welcome/home'
    end
  end


  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.password = SecureRandom.urlsafe_base64
      end
    else
      if(params[:password_confirmation] && (params[:password] == params[:password_confirmation]))
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      else
        flash.now.alert = "There were errors on your form"
        flash.now.alert = "please confirm your passwords match and all field are complete"
        render 'users/new'
      end
    end
    if @user
      if @user.save
        session[:user_id] = @user.id
        render 'welcome/home'
      else
        # if email or password incorrect, re-render login page:
        flash.now.alert = "Incomplete form, try again."
        render 'users/new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
