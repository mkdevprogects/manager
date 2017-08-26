class Clinic < ActiveRecord::Base
  has_many :practices
  has_many :doctors, through: :practices

  has_many :visits

  has_many :performed_actions, as: :subject

  validates :title, presence: true
  validates :email, presence: true, uniqueness: true

  def specializations_titles
    Specialization.joins(doctors: [:clinics]).where("clinics.id=?", self.id).pluck(:title).uniq
  end
end
