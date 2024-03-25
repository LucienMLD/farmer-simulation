class FarmsController < ApplicationController
  def new
    redirect_to root_path if current_user.farm.present?
    @farm = Farm.new
    authorize @farm
  end

  def create
    authorize :farm, :create?
    @farm = Farm.new(farm_params)
    @farm.user = current_user
    if @farm.save
      redirect_to @farm, notice: t('.farm_created')
    else
      render :new, alert: t('errors.form_not_valid')
    end
  end

  def show
    @farm = Farm.find(params[:id])
    authorize @farm

    @markers = [{
        lat: @farm.latitude,
        lng: @farm.longitude,
        name: @farm.name,
        info_window_html: render_to_string(partial: "info_window", locals: {object: @farm})
        }]
  end

  private

  def farm_params
    params.require(:farm).permit(:name, :city, :country)
  end
end
