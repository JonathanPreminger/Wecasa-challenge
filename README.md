Welcome in the WeCasa challenge ! 

Download the repo, cd inside, then rails db:drop db:create db:migrate db:seed, then rails s.
The seed is gonna parse the data.json at the root of the app and create all the database.

Open locahost:3000, and you will be on the index of booking.
You can access to the 4 booking stored in the database.
The show page of booking is a proposition of front style, you will find at this page the result of the Matching module, in concern in controllers, called in the method show of the booking controller. 
The matching result is the composition of the matching prestation, the matching datetime, and the matching location wich use the geocoder gem.
The pro available at the verry end of the show page is the pro who match all those matching parameters.

At locahost:3000/bookings/new, you will find a form to create a new booking.

Thank you for your attention,

Jonathan Mete
