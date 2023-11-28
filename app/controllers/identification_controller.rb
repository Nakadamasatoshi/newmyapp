class IdentificationController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
    render :new
  end

  # def create
  #   @user = User.find(params[:id])vv

  #   if @user.update(user_params)
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end



  def create
    user = current_user
    @user = User.new(user_params)

    if params[:user][:image]
      user.image.attach(params[:user][:image])
    end
    if user.save
      redirect_to index_mypage_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    Rails.logger.debug("Activity Params: #{profile_params.inspect}")
    @profile = Profile.find(params[:id])
    if params[:profile][:image]
      @Profile.image.attach(params[:profile][:image])
    end
    if @profile.update(profile_params)
      redirect_to index_mypage_path, notice: '更新しました'
    else
      Rails.logger.debug(@profile.errors.inspect)
      redirect_to index_mypage_path, notice: '失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to edit_user_path(@user)
  #   else
  #     render :edit
  #   end
  # end

  private

  def profile_params
    params.require(:profile).permit(:license_image, :personal_image)
  end
end
