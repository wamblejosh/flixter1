class LessonsController < ApplicationController
	before_action :authenticate_user!
  	before_action :require_authorized_for_current_lesson, only: [:show]
	
	def show

    end

	private

	def require_authorized_for_current_lesson
	 	if current_user.enrolled_in?(current_lesson.section.course)
	 	 #redirect_to course_path, alert: 'Youare enrolled' 
	 	 render :show, alert: 'you are enrolled'
	 	else 
	 		redirect_to course_path, alert: 'you are not enrolled'
	 	# else 
	 	# 	current_lesson.section.course
	    end
	end
	
	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end


end

