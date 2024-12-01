class Author < ApplicationRecord
  # def full_name
  #   "#{first_name} #{last_name}"
  # end

  def coordinates
    [rand(90), rand(90)]
  end

  def publication_years
    (1..rand(10)).to_a.map { rand(1801..1900) }
  end
end
