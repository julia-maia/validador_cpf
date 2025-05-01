class CadastrosController < ApplicationController
  def new
    @cadastro = Cadastro.new
  end

  def create
    @cadastro = Cadastro.new(cadastro_params)

    if @cadastro.save
      redirect_to root_path, notice: "CPF válido! Cadastro criado com sucesso."
    else
      render :new
  end
end

private

 def cadastro_params
  params.require(:cadastro).permit(:nome, :cpf)
 end
end