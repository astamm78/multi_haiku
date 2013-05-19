class Admin < ActiveRecord::Base

  include BCrypt

  validates :email, :presence => true, :format => {:with =>  /\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3}/},
            :uniqueness => true
  validates :password, :presence => true
  before_save :encrypt

  def self.authenticate(email, password)
    admin = Admin.find_by_email(email)

    return true if admin && Password.new(admin.password) == password
    false
  end

  def encrypt
    to_hash = self.password
    self.password = BCrypt::Password.create(to_hash)
  end

  def get_stats
    stats_array = []
    self.rounds.each do |round|
      stats_array << round.results
    end
    stats_array
  end

end
