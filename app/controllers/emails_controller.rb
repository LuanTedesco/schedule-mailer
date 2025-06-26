class EmailsController < ApplicationController
  layout "application_signed"
  before_action :set_email, only: %i[ show edit update destroy ]

  def index
    @emails = Email.all
    @pagy, @emails = pagy(@emails, items: 10)
  end

  def new
    @email = Email.new
  end

  def edit
  end

  def create
    @email = Email.new(email_params)
    @email.save

    if @email.scheduled_at.present? && @email.scheduled_at < Time.current
      response = EmailMailer.send_email(@email).deliver_now
      #@email.update(sended: true) if response.status == 200
      flash[:success] = "Email enviado com sucesso."
    end

    flash[:success] = "Email was successfully created."
    redirect_to emails_path
  end

  def update
    email_params.delete(:status) if !can_update_status?
    @email.update(email_params)
    flash[:success] = "Email was successfully updated."
    redirect_to emails_path
  end

  def destroy
    @email.update(status: false)
    flash[:success] = "Email was successfully destroyed."
    redirect_to emails_path
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:to, :subject, :body, :status, :scheduled_at, :sended)
  end
end
