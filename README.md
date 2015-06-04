# Lasslo - password generator for humans
Gem install lasslo to generate unique, encryped and secure passwords for your models

To generate a random but human password with lenght 10:
Lasslo.generate 10

To generate a random human password never used for your model with lenght 10:
Lasslo.unique 10, :user
:user is the name of your model, it can also be :task for Task or whatever you want

To generate a random human password never used for your model with lenght 10:
Lasslo.unique 10, :user

To generate an encrypted random human password never used for your model with lenght 10:
Lasslo.unique_encrypted 10, :user

To decrypt a password
Lasslo.decrypt "encryptedpasswordwhatever"

To encrypt a password
Lasslo.decrypt "encryptedpasswordwhatever"
