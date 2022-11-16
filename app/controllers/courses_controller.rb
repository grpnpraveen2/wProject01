class CoursesController < ApplicationController
  def index
    render json: Course.all
  end


  def create 
    course=Course.new(course_params)
    
    if course.save
      render json: course, status: :created
    else
      render json: course.errors,status: :unprocessable_entity
    end
  end

  def destroy

    course = Course.find(params[:id])
    course.destroy!
    render json: {"Message":"successfully deleted course with id #{params[:id]}" },status: :accepted
  end

   #update
   def update
    course = Course.find(params[:id])
    course.update(course_params)
    if course.save
      render json: {"Message":"successfully updated course with id #{params[:id]}" },status: :accepted
    else
      render json: course.errors,status: :unprocessable_entity
    end

  end

  private

  def course_params

    params.require(:course).permit(:course_name,:duration,:active)

  end
end
