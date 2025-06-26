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
      begin
        EmailMailer.send_email(@email).deliver_now
        @email.update(sended: true)
        flash[:success] = "Email enviado com sucesso."
      rescue => e
        flash[:error] = "Falha ao enviar o e-mail: #{e.message}"
      end
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

  def boost_email_body
    text = params[:body]

    result = RequestGemini.new.boost_email_body(ENV["TESTE"], text)
    render json: { result: result }
  end

  def fix_errors_body
    text = params[:body]
    result = RequestGemini.new.fix_errors_body("Corrija erros de português", text)
    render json: { result: result }
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:to, :subject, :body, :status, :scheduled_at, :sended)
  end
end
