# Bus-Ticket-Booking-System
It is  a project written in PLSQL, which demonstrates a simple bus ticket booking system with two counter. Here the idea of distributed database is implemented

The running procedure :
+ You'll need Oracle 10g installed on your pc.
+ You'll have to run each file in SQLPlus.
+ To implement different server at different computer you'll need to follow a set of instructions to change firewall and network settings. For that go to [this](https://drive.google.com/drive/u/0/folders/1aQSpEctXDqORn3Vo3TDWf0pDWZBZA3rZ)


#Project Details
In this project I have used mainly 2 server, the first one (Server-Site1) as Main Server and the second one (Srever-Site2) as client server.
I had to download virtual machine to run 2 server at my pc
+The main server can create new bus, new route and transcation whereas the client was given access of the schedule only(MainDB1)
+There are several packages for the customer where they want to travel to 
+There is some specific location where the traveler can book from 
+The travelers can search for the speciic location and the availability will be shown there
+If the location is not available then a message will be shown to the customer that no service available at that location
+The customer can also book from both of the server and can cancel booking and their total transcation price will be shown 
+Whenever a ticket is booked the available sit will be updated to the servers
