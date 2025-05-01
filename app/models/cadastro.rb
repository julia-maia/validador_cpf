class Cadastro < ApplicationRecord
    validates :nome, presence: { message: "é obrigatório" }
    validates :cpf, presence: true, cpf: true  
end
