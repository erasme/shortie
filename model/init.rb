# On configure un adaptateur de base pour sqlite
# Le handle de connexion sera stocké dans DB, et sera dispo partout dans le code
# Le paramètre :test permet de s'assurer que la connexion est bien ouverte
# et fonctionnelle avant d'être utilisée'
DB = Sequel.connect(
  :adapter  => 'sqlite',
  :database => __DIR__('../database.db'),
  :test     => true,
  :encoding => 'utf8'
)

# On charge nos modèles
require __DIR__('short')
