class SearchController < ApplicationController
  before_action :check_params

  def results
    @query = params[:query]
    @course_results = global_search_query('Course')
    @lesson_results = global_search_query('Lesson')
    @content_results = global_search_query('Content')
  end

  private

  def global_search_query(controller_name)
    controller_class = controller_name.constantize
    controller_class.global_search(@query)
  end

  def check_params
    redirect_to root_path if params[:query].nil? || params[:query].empty?
  end
end
