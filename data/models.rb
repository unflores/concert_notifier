class Band
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :url,        Text
  property :created_at, DateTime
end