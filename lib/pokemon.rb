class Pokemon

attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db: db = nil, hp: hp = 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    binding.pry
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
  end

  def self.find(id, db, hp=60)
    found_pk = db.execute("SELECT * from pokemon WHERE (id=?)", id)
    found_pk = found_pk.flatten
    Pokemon.new(id:found_pk[0],name:found_pk[1],type:found_pk[2], db: db, hp: hp)
  end

  def alter_hp(new_hp)

  end

end
