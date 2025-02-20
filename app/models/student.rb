# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(string)
    search_results = []
    if string.blank?
      search_results = self.all
    else
      self.all.each do |student|
        if student.name.downcase.include?(string.downcase)
          search_results << student
        end
      end
    end
    search_results
  end

end
