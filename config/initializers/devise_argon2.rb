module Argon2Encryptor
  def digest(klass, password)
    if klass.pepper.present?
      password = "#{password}#{klass.pepper}"
    end
    if Rails.env.test?
      ::Argon2::Password.new(t_cost: 1, m_cost: 3).create(password)
    else
      ::Argon2::Password.new(t_cost: 2, m_cost: 16).create(password)
    end
  end

  def compare(klass, hashed_password, password)
    return false if hashed_password.blank?

    if hashed_password.start_with?("$argon2")
      if klass.pepper.present?
        password = "#{password}#{klass.pepper}"
      end
      ::Argon2::Password.verify_password(password, hashed_password)
    else
      super
    end
  end
end

Devise::Encryptor.singleton_class.prepend(Argon2Encryptor)
