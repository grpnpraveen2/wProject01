require 'date'
class CourseScheduleController < ApplicationController

    def index
        render json: CourseSchedule.all
    end

    def create 
        courseSchedule=CourseSchedule.new(courseSchedule_params)
        
        if courseSchedule.save
          render json: courseSchedule, status: :created
        else
          render json: courseSchedule.errors,status: :unprocessable_entity
        end
    end

    def destroy

        courseSchedule = CourseSchedule.find(params[:id])
        courseSchedule.destroy!
        render json: {"Message":"successfully deleted courseSchedule with id #{params[:id]}"},status: :accepted
      end

  #update
  def update
    courseSchedule = CourseSchedule.find(params[:id])
    courseSchedule.update(courseSchedule_params)
    if courseSchedule.save
      render json: {"Message":"successfully updated courseSchedule with id #{params[:id]}" },status: :accepted
    else
      render json: courseSchedule.errors,status: :unprocessable_entity
    end

  end

  #custom
  def active_courses
    given_Date= Date.parse(params[:date])

    cs_l=CourseSchedule.where('start_date <= ?', given_Date).where('end_date >= ?', given_Date)
    output=[]
    for i in cs_l
      c=Course.find(i[:course_id])
      if c[:active]
        single_Element={}

        single_Element["course_name"]=c[:course_name]
        single_Element["total_seats"]=i[:total_seats]
        single_Element["course_id"]=i[:course_id]

        output << single_Element
      end

    end

    render json: output
  end

  def student_count
    student_count=Enrolled.where(course_schedule_id:params[:id]).count
    output={}
    output["student_count"]=student_count
    render json: output
  end

  private
    def courseSchedule_params
        params.require(:course_schedule).permit(:start_date,:end_date,:total_seats,:course_id)
    end

end
