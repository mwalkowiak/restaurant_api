module TokenGenerator
  extend ActiveSupport::Concern

  # Generates a token in the given column
  # The algorithm generates a 32 character guid

  def generate_token!(column)
    attempts = 3

    begin
      token = SecureRandom.urlsafe_base64(24)
      update_column(column, token)
    rescue ActiveRecord::RecordNotUnique
      retry if (attempts -= 1) > 0
    end

    send(column) == token
  end
end
