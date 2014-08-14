module Stack4stack
  module Actions

    extend ActiveSupport::Concern

    def open!
      self.status = "open"
      self.save!
    end

    def close!
      self.status = "closed"
      self.save!
    end

    def filled!
      self.status = "filled"
      self.save!
    end

  end
end