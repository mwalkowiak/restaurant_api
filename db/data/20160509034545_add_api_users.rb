class AddApiUsers < ActiveRecord::Migration
  USERS = [
      {
          :first_name => 'Mike',
          :last_name => 'Walkowiak',
          :email => 'mw@mwalkowiak.com'
      },
      {
          :first_name => 'John',
          :last_name => 'Smith',
          :email => 'jsmith@fakeemailaddresshere.com'
      },
      {
          :first_name => 'Andy',
          :last_name => 'Morris',
          :email => 'amorris@fakeemailaddresshere.com'
      },
      {
          :first_name => 'Steve',
          :last_name => 'Adams',
          :email => 'sadams@fakeemailaddresshere.com'
      },
  ]

  def self.up
    USERS.each do |user|
      User.create(user)
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
