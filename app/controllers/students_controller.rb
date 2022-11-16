class StudentsController < ApplicationController

    def index
      render json: Student.all
    end

    def create 
      student=Student.new(student_params)
      
      if student.save
        render json: student, status: :created
      else
        render json: student.errors,status: :unprocessable_entity
      end
    end

    def destroy

      student = Student.find(params[:id])
      student.destroy!
      render json: {"Message":"successfully deleted student with id #{params[:id]}"},status: :accepted
    end

    #update
   def update
    student = Student.find(params[:id])
    student.update(student_params)
    if student.save
      render json: {"Message":"successfully updated student with id #{params[:id]}" },status: :accepted
    else
      render json: student.errors,status: :unprocessable_entity
    end

    end
    private

      def student_params

        params.require(:student).permit(:first_name,:last_name,:dob)

      end

     

end
