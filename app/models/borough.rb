class Borough
  include MongoMapper::Document
  many :people
  many :districts

  key :name, String
  key :slug, String
  key :services_id, String

end
