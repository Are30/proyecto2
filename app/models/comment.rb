class Comment < ApplicationRecord
  # Asociaciones
  belongs_to :article  # Relación con el artículo
  belongs_to :user     # Relación con el usuario (autor del comentario)

  # Validaciones
  validates :body, presence: true  # Asegúrate de que el cuerpo del comentario no esté vacío
end
