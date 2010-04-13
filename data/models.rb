class Band
  include DataMapper::Resource
  
  property :id,         Serial
  property :name,       String
  property :url,        Text
  property :created_at, DateTime
  
end

class Connection
  include DataMapper::Resource
  property :id,   Serial
  
  belongs_to :band
  belongs_to :dm_user
end

class DmUser
   has n, :connections
   has n, :bands, :through => :connections
end


class Band
     has n, :connections
     has n, :dm_users, :through => :connections
end

