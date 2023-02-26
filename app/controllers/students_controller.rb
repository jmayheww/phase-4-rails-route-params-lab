class StudentsController < ApplicationController
  def index
    students = if params[:name]
                 Student.select { |student| student.first_name == params[:name] || student.last_name == params[:name] }
               else
                 Student.all
               end
    render json: students
  end

  def show
    student_by_id = Student.find(params[:id])
    render json: student_by_id
  end
end
