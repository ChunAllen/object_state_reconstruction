class ObjectStatesController < ApplicationController

  before_action :prepare_search_form, only: [:index]

  def index
    @object_states = @search_form.search
  end

  def new; end

  def create
    @object_state = ObjectStateForm.new(object_state_params)
    if @object_state.save
      redirect_to object_states_path
    else
    end
  end

  private

  def object_state_params
    params.require(:file_upload).permit(:csv)
  end

  def prepare_search_form
    @search_form = SearchForm.new(params[:search_form] || {})
  end

end
