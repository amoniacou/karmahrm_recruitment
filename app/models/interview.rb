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

class Interview < ActiveRecord::Base
  belongs_to :recruitment
  belongs_to :interviewer, class_name: 'Employee', foreign_key: 'interviewer_id'
  validates :no_of_candidates, numericality: { greater_than_or_equal_to: 10 }
end
