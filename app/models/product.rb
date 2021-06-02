class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_one_attached :product_image

  has_one_attached :brochure

  validates :name, :image_url, :price, :stock, :presence => true
  validate :document_extension


  private

  def document_extension
    return unless brochure.attached?

    valid_types = ["application/pdf", "application/msword"] #Solamente aceptando .PDF o .DOC (.DOCX: "application/vnd.openxmlformats-officedocument.wordprocessingm")
    unless valid_types.include?(brochure.content_type)
      errors.add(:brochure, "(NO tiene un formato de archivo soportado!)")
    end
  end

end
