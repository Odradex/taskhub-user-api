class AuthService
  def self.authenticate(token)
    decoded_token = decode_token(token)
    User.find(decoded_token[0]['user']['user_id'])
  end

  def self.generate_tokens(user)
    {
      jwt_token: issue_token(user),
      refresh_token: SecureRandom.hex(32)
    }
  end

  def self.issue_token(user)
    exp = 24.hours.from_now
    exp_payload = {
      user: user.slice(:id, :role),
      exp: exp.to_i
    }

    JWT.encode(exp_payload, ENV['JWT_SECRET'], 'HS256')
  end

  def self.refresh_token(token, refresh_token)

  end

  def self.decode_token(token)
    JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
  end
end
