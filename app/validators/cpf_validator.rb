class CpfValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.blank?
  
      unless valid_cpf?(value)
        record.errors.add(attribute, :invalid_cpf, message: "não é um CPF válido")
      end
    end
  
    private
  
    def valid_cpf?(cpf)
      cpf = cpf.to_s.gsub(/[^0-9]/, '')
      
      # Verifica se tem 11 dígitos e não é uma sequência repetida
      return false unless cpf.size == 11 && cpf !~ /^(\d)\1{10}$/
      
      # Calcula e verifica os dígitos verificadores
      digits = cpf.chars.map(&:to_i)
      
      # Primeiro dígito verificador
      sum = (0..8).sum { |i| digits[i] * (10 - i) }
      remainder = sum % 11
      first_digit = remainder < 2 ? 0 : 11 - remainder
      return false unless digits[9] == first_digit
      
      # Segundo dígito verificador
      sum = (0..9).sum { |i| digits[i] * (11 - i) }
      remainder = sum % 11
      second_digit = remainder < 2 ? 0 : 11 - remainder
      
      digits[10] == second_digit
    end
  end