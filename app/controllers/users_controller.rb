class UsersController < Clearance::UsersController
  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now
 
        format.html { redirect_to sign_in_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_from_params
   	first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    gender = user_params.delete(:gender)
    country = user_params.delete(:country)
    phone = user_params.delete(:phone)
    birthdate = user_params.delete(:birthdate)
    avatar = user_params.delete(:avatar)


    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.email = email
      user.password = password
      user.gender = gender
      user.phone = phone
      user.country = country
      user.birthdate = birthdate
      user.avatar = avatar
    end
  end

  private

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

  def permit_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:phone,:gender,:birthdate, :country, :avatar)
  end 
    
end