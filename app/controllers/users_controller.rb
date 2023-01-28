class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, 
                                  :edit_basic_info, :update_basic_info, 
                                  :user_edit, :user_update]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, 
                                        :update_basic_info, :user_edit, :user_update, :working_now]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info, 
                                    :user_edit, :user_update]
  before_action :set_one_month, only: :show
  
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def import
    # fileはtmpに自動で一時保存される
    User.import(params[:file])
    redirect_to users_url
  end
  
  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザーの登録に成功しました"
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
    flash[:success] = "ユーザー情報を更新しました"
    redirect_to @user
    else
      render :edit      
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました"
    redirect_to users_url
  end
  
  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
      render :show
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました<br>" + @user.errors.full_messages.join("<br>")
      redirect_to edit_basic_info_user_url
    end
  end
  
  def user_edit
  end
  
  def user_update
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
      render :show
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました<br>" + @user.errors.full_messages.join("<br>")
      redirect_to edit_basic_info_user_url
    end
  end
  
  def working_now
    @now_users = []
    @now_users_employee_number = []
    ary = [@now_users_employee_number,@now_users].transpose
    h = Hash[*ary.flatten]
    User.all.each do |user|
      if user.attendances.any?{|day|
        ( day.worked_on == Date.today && !day.started_at.blank? && day.finished_at.blank?)
        }
        @now_users.push(user.name)
        @now_users_employee_number.push(user.employee_number)
      end
    end
  end
  
  def bace
  end
  
  private
  
   def user_params
     params.require(:user).permit(:name, 
                                  :email, 
                                  :password, :password_confirmation 
                                  )
   end
   
   def basic_info_params
     params.require(:user).permit(:affiliation,
                                  :basic_time, 
                                  :work_time,
                                  :designated_work_start_time, 
                                  :designated_work_end_time
                                  )
   end

end
