class ImportancesController < ApplicationController
  before_action :set_importance, only: [:edit, :update]

  def index
    @importances = policy_scope(Importance)
  end

  def edit
    @importance.value = params[:value]
  end

  def update
    authorize @importance
    if @importance.value.update(params[:value])
      redirect_to importances_path
    else
      render :edit
    end
  end

  private

    def set_importance
      @importance = Importance.find(params[:id])
    end

    def importance_params
      params.require(:importance).permit(:name, :value)
    end
end
