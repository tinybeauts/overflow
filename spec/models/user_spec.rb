require 'spec_helper'

describe User do

   it { should_not allow_mass_assignment_of :password_digest }
   it { should allow_mass_assignment_of :first_name }
   it { should allow_mass_assignment_of :last_name }
   it { should allow_mass_assignment_of :email }
   it { should allow_mass_assignment_of :password }
   it { should allow_mass_assignment_of :password_confirmation }

   it { should have_many(:questions)}
   it { should have_many(:answers)  }
   it { should have_many(:responses)}
   it { should have_many(:votes)    }

   it { should validate_presence_of(:first_name)}
   it { should validate_presence_of(:email)}
   it { should validate_presence_of(:password)}
   it { should validate_presence_of(:password_confirmation)}

   it { should allow_value("blah@blah.blah").for(:email)}
   it { should_not allow_value("b@b.b").for(:email)}

   it "validates uniqueness of email" do 
    User.new(first_name: "test", last_name: "last", email: "user@example.com", password: "123456").save!(validate: false)
    should validate_uniqueness_of(:email)
   end

   it { should ensure_length_of(:password).is_at_least(6) }

end
