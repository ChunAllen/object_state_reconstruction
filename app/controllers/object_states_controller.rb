class ObjectStatesController < ApplicationController

  before_action :prepare_search_form, only: [:index]

  def index; end

  def new; end

  def create
    @object_state = ObjectStateForm.new(object_state_params)
    if @object_state.save
      flash[:notice] = 'CSV has been imported'
    else
      flash[:error] = @object_state.errors.full_messages.to_sentence
    end
    redirect_to object_states_path
  end

  private

  def object_state_params
    params.require(:file_upload).permit(:csv)
  end

  def prepare_search_form
    search_params = params[:search_form].present? ? params[:search_form].permit(:object_id, :object_type, :timestamp) : {}
    @search_form = SearchForm.new(search_params)
  end

end
