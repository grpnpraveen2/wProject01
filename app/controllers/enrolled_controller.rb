class EnrolledController < ApplicationController

    def index
        render json: Enrolled.all
    end

    def create 
        enrolled=Enrolled.new(enrolled_params)
        
        if enrolled.save
          render json: enrolled, status: :created
        else
          render json: enrolled.errors,status: :unprocessable_entity
        end
    end

    def destroy

        enrolled = Enrolled.find(params[:id])
        enrolled.destroy!
        render json: {"Message":"successfully deleted enrolled with id #{params[:id]}"},status: :accepted
      end

  #update
  def update
    enrolled = Enrolled.find(params[:id])
    enrolled.update(enrolled_params)
    if enrolled.save
      # render json: "hi"
      render json: {"Message":"successfully updated enrolled with id #{params[:id]}" },status: :accepted
    else
      render json: enrolled.errors,status: :unprocessable_entity
    end

  end

  #custom
  def enrolled_students

    l_en=Enrolled.where(course_schedule_id: CourseSchedule.where(course_id: params[:course_id]))
    c=Array.new
    for i in l_en
        c << i[:student_id]
    end
    s_l=Array.new
    for i in c
      s=Student.find(i)
      s_l << s[:first_name]
    end

    render json: s_l
  end


    private
    def enrolled_params
        params.require(:enrolled).permit(:status,:course_schedule_id,:student_id)
    end


end
