module User

  # allows us to provide shared validations and other class specific instances
  extend ActiveSupport::Concern

  # must be included to give functionality to classes
  included do
    # for authentication
    has_secure_password

    # validations
    
    # shared
    validates_presence_of :email
    validates_uniqueness_of :email
    validates_confirmation_of :password
    
    # logic based
    validates_presence_of :name, :if => Proc.new {|f| f.class == Company}
    validates_presence_of [:first_name, :last_name], :if => Proc.new {|f| f.class == Jobseeker}

    # associations
    has_one :stack, as: :stackable, dependent: :destroy

    delegate :get_tech, to: :stack
  end

end