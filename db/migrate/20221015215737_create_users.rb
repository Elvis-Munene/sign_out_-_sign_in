class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest  #password digest is used to create password fields in rails.
                                #Encryption of password is done by bcrypt_gem..


      t.timestamps
    end
  end
end
