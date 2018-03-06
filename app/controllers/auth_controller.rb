class AuthController < ApplicationController

  def login
   begin
     user = login_user(params[:email], params[:password])
     render json: {
       user: user,
       token: encode_token({'user_id': user.id})
     }
   rescue AuthError => e
     render json: { error: e }, status: 401
   end
  end

  def currentUser
    user = current_user
   if user
     render json: { user: user }
   else
     render json: nil
   end
  end

def signup
  user = User.new(user_params)
  if user.save
    begin
      user = login_user(user_params[:email], user_params[:password])
      render json: {
        user: user,
        token: encode_token({'user_id': user.id})
      }
    rescue AuthError => e
      render json: { error: "Invalid Passwords"}, status: 401
    end
  else
    render json: { error: "Need all info correct to sign up" }
  end

end

private


def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password)
end


end
