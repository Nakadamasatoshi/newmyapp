class MypageController < ApplicationController
  before_action :authenticate_user!

  def index
    render 'mypage/index'
  end
  
  def new
    @profile = Profile.new
    render :new
  end


  def create
    @profile = Profile.new(profile_params)

    if params[:profile][:image]
      @profile.image.attach(params[:profile][:image])
    end
    if @profile.save
      redirect_to index_mypage_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :familyname, :firstname, :birthdate, :phonenumber, :postalcode, :comment, :prefecture, :city, :town, :buildingname)
end
end


