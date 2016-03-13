# == Schema Information
#
# Table name: recruitments
#
#  id             :integer          not null, primary key
#  department_id  :integer
#  title          :text
#  content        :text
#  start_date     :date
#  end_date       :date
#  position       :text
#  no_of_openings :integer
#  is_deleted     :boolean          default(FALSE)
#  is_completed   :boolean          default(FALSE)
#  is_published   :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Recruitment < ActiveRecord::Base
  belongs_to :department
  has_many :candidates
  has_many :interviews








  # instance methods
   def get_remain_candidates_count
    candidate_count = no_of_openings - interviews.sum(:no_of_candidates)
   end


end
