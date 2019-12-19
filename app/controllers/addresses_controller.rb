class AddressesController < ApplicationController

  def edit
    @address = current_user.addresses.first
  end

  def update
    address = current_user.addresses.first
    # binding.pry¥
    if address.update!(address_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :street_number, :building_name)
  end


end
