class ObjectStatesController < ApplicationController

  def index
    @object_states = SearchForm.new(params || {}).search
  end

  def create
    @object_state =  ObjectStateForm.new(object_state_params)
    if @object_state.save
      redirect_to object_states_path
    else
    end
  end

  private

  def object_state_params
    params.require(:file_upload).permit(:csv)
  end

end
