Pokemon-shop

First do: 
$ Composer install 
$ php bin/console doctrine:schema:create 

Import the file pokebd.sql to have all data about the website.

and enjoy it with : 
$ php bin/console server:run

More Informations:
Fos User :

 Admin: 
  username: admin
  e-mail: admin@test.fr
  password: admin

 To create an other admin: 
  $ php bin/console fos:user:create adminname --super-admin


Routing:

 "/" : homepage
 "/item" : list of items
 "/item/{id} : view of one item


  Admin: 
   "/admin" : dashboard
   "/admin/add/item" : add item
   "/admin/add/category" : add category
