# == Schema Information
#
# Table name: interviews
#
#  id                :integer          not null, primary key
#  title             :text
#  recruitment_id    :integer
#  interviewer_id    :integer
#  date_of_interview :date
#  is_deleted        :boolean          default(FALSE)
#  no_of_candidates  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InterviewsController < ApplicationController
  before_action :interview_params, only: [:create, :update]
  before_action :set_recruitment
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # #using crud
  def index
    @interviews = @recruitment.interviews
  end

  def show
  end

  def new
    @interview = @recruitment.interviews.new
    @employees=Employee.active.includes(:user)
  end

  def  create
    @recruitment = Recruitment.find(params[:recruitment_id])
    @interview = @recruitment.interviews.new(interview_params)
    if @interview.save
      redirect_to [@recruitment, @interview]
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def show
    @interview = Interview.find(params[:id])
  end

  private

  def set_recruitment
    @recruitment = Recruitment.find(params[:recruitment_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:title, :interviewer_id, :no_of_candidates, :date_of_interview)
  end
end
