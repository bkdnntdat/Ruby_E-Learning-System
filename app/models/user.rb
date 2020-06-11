class User < ApplicationRecord
    has_secure_password

    before_destroy {words.clear}
    before_save {self.email = email.downcase}

    has_and_belongs_to_many :words
end
