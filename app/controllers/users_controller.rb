class UsersController < ApplicationController
  layout "application_signed"
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @users = @users.order(status: :desc, role: :desc, name: :asc)
    filter
    @pagy, @users = pagy(@users, items: 10)
  end

  def show
    redirect_to root_path
    flash[:alert] = "Voce nao tem permissao para realizar essa acao."
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
      flash[:success] = "Usuario criado com sucesso."
    else
      render :new
    end
  end

  def update
    @user.avatar.attached?
    if @user.update(user_params)
      flash[:success] = "Usuario atualizado com sucesso."
      redirect_to users_path
    end
  end

  def destroy
    @user.update(status: false)
    redirect_to users_path
    flash[:success] = "Usuario apagado com sucesso."
  end

  private

  def filter
    if params[:filter_name].present?
      @users = @users.where("LOWER(name) LIKE ?", "%#{params[:filter_name].downcase}%")
    end
    if params[:filter_email].present?
      @users = @users.where("LOWER(email) LIKE ?", "%#{params[:filter_email].downcase}%")
    end
    if params[:filter_role].present?
      @users = @users.where(role: params[:filter_role])
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :status, :role, :avatar).tap do |user_params|
      if params[:user][:password].present?
        user_params[:password] = params[:user][:password]
        user_params[:password_confirmation] = params[:user][:password_confirmation]
      end
    end
  end
end
