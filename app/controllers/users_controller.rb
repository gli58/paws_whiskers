class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @orders = @user.orders.order(created_at: :desc).limit(5)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, success: "Profile updated successfully!"
    else
      render :edit, alert: "Failed to update profile"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :street_address, :city, :province_id, :postal_code)
  end
end
