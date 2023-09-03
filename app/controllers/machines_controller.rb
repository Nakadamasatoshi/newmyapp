class MachinesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @title = params[:title]
    if @title.present?
      @machines = Machine.where('title LIKE ?', "%#{@title}%")
    else
      @machines = Machine.all
    end
    render :index
  end

  #ここから追加

  def new
    @machine = Machine.new
    render :new
  end

  def create
    @machine = Machine.new(machine_params)

    if params[:machine][:image]
      @machine.image.attach(params[:machine][:image])
    end
    if @machine.save
      redirect_to new_machine_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private
def machine_params
  params.require(:machine).permit(:title, :length, :width, :height, :horsepower, :weight, :fuel, :cabin, :attachment, :using_time, :maintenance, :transportation, :supplement)
end
