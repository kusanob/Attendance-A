class BacesController < ApplicationController
  
  def index
    @baces = Bace.all
  end
  
  def show
    @bace = Bace.find(params[:id])
  end

  def new
    @bace = Bace.new
  end
  
  def create
    @bace = Bace.new(bace_params)
    if @bace.save
      flash[:success] = "新たに#{@bace.bace_name}を作成しました。"
      redirect_to baces_url
    else
      flash[:danger] = "新規拠点の作成に失敗しました。"
      redirect_to baces_url
    end
  end

  def edit
  end
  
  def destroy
    @bace = Bace.find(params[:id])
    @bace.destroy
    flash[:success] = "#{@bace.bace_name}のデータを削除しました"
    redirect_to baces_url
  end
  
  private

    def bace_params
      params.permit(:bace_number, :bace_name, :bace_type)
    end

end