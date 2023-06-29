class StudentsController < ApplicationController

  def index

    #I tried to make the query case-insensitive since case is meaningless where names are concerned.
    if (params[:name])
      name = params[:name].downcase
      students = Student.where('LOWER(first_name) = ? OR LOWER(last_name) = ?', name, name)
      render json: students
    else
      students = Student.all
      render json: students
    end

  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
  
  def grades
    students = Student.all.order(grade: :desc)
    render json: students
  end

  def highest_grade
    student = Student.all.order(grade: :desc).limit(1)
    render json: student
  end

end
