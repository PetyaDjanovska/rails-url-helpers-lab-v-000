class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def edit
    @student = set_student
    @student.active ? @student.active = false : @student.active = true
    @student.save
    redirect_to @student
  end
  #
  # def update
  #   @student = set_student
  #   @student.update(params.require(:student).permit(:active))
  # end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
