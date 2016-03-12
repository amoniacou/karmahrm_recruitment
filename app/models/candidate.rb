# == Schema Information
#
# Table name: candidates
#
#  id                :integer          not null, primary key
#  recruitment_id    :integer
#  first_name        :text
#  last_name         :text
#  address           :text
#  dob_date          :date
#  city              :text
#  state             :text
#  pin_code          :integer
#  home_phone_number :integer
#  mobile            :integer
#  email             :text
#  qualification     :text
#  status            :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Candidate < ActiveRecord::Base
  include ActiveModel::Validations
  validates :recruitment_id, presence: true
  validates :first_name, :last_name, :dob_date, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :mobile, presence: { message: 'Invalid Mobile number !' }, numericality: true, length: { minimum: 10, maximum: 10 }
  belongs_to :recruitment
  after_initialize :default_values
  def default_values
    self.status = false
  end

  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end
end
