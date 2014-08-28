Citi Bike Wizard
===========

A Citibike helper that provides a list of close-by stations with bike/dock availability overview. Currently the rush hour warning system is being implemented. In the near future I will add "saved locations" functionality so users can convieniently pull up their saved lists such as "Home stations" & "Work stations."

Comments are welcomed. 

To Fork/Clone

First, turn on Postgresql

bundle install

rake db:create 

rake db:migrate 

rails c 

require './dbcitibike.rb'

require './crossStreet.rb'
