class BusinessCard < ActiveRecord::Base
  validates :name, :presence => true
  validates_attachment_presence :image

  has_attached_file :image
  has_attached_file :card

  after_commit :create_card_in_queue, :on => :create

  def create_card_in_queue
    delay.create_card
  end

  def create_card
    pdf = Prawn::Document.new(:page_size => [300, 150], :margin => 5)
    pdf.text name, :align => :center, :size => 12
    pdf.image image.path, :fit => [ 200, 100 ], :position => :center

    self.card = returning StringIO.new(pdf.render) do |io|
      io.original_filename = name.gsub(/[^a-zA-Z]/, "_") + ".pdf"
      io.content_type = "application/pdf"
    end

    save
  end
end
