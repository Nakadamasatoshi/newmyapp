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
    @profile.user_id = current_user.id
  
    # if params[:profile][:image]
    #   @profile.image.attach(params[:profile][:image])
    # end
    
  
    if @profile.save
      redirect_to index_mypage_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 編集機能を追加
  def edit
    @profile = Profile.find(params[:id])
    render :edit
  end

  def update
    Rails.logger.debug("Activity Params: #{profile_params.inspect}")
    @profile = Profile.find(params[:id])
    if params[:profile][:image]
      @profile.image.attach(params[:profile][:image])
    end
    if @profile.update(profile_params)
      redirect_to index_mypage_path, notice: '更新しました'
    else
      Rails.logger.debug(@profile.errors.inspect)
      redirect_to index_mypage_path, notice: '失敗しました'
      # render :edit, status: :unprocessable_entity
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :familyname, :firstname, :birthdate, :phonenumber, :postalcode, :comment, :prefecture, :city, :town, :buildingname)
end
end


