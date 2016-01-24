module Helpers
  module Birthday
    def get_birthday
      interval = (Date.today - Date.new(1991, 3, 25)).to_i / 365.0
      interval.round(2)
    end
  end
end
