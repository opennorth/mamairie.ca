class District
  include MongoMapper::Document
  belongs_to :borough

  key :name, String, required: true, unique: true
  key :slug, String, required: true, unique: true

  ensure_index :name
  ensure_index :slug

  before_validation :set_slug

private

  def set_slug
    if name
      self.slug = name.slug
    end
  end
end
