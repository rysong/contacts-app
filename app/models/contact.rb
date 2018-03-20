class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :email, presence: true
  validates :email, uniqueness: true
  
  belongs_to :user

  def friendly_updated_at 
    updated_at.strftime("%B %e, %Y")
  end 

  def full_name
    full_name = "#{first_name} #{middle_name} #{last_name}" 
  end 

  def japanese_phone_number
    japanese_phone_number = "+81" + phone_number
  end 

  def as_json 
    { 
      id: id, 
      first_name: first_name,
      middle_name: middle_name, 
      last_name: last_name,
      full_name: full_name,
      email: email, 
      phone_number: phone_number, 
      japanese_phone_number: japanese_phone_number, 
      updated_at: friendly_updated_at
    }

  end 
  
end
