class CreateCadastros < ActiveRecord::Migration[8.0]
  def change
    create_table :cadastros do |t|
      t.string :nome
      t.string :cpf

      t.timestamps
    end
  end
end
