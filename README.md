##Event_Lite  

Event lite is a 'Event Management System' which allows user to let know his friends about the events he hosts and to send invitations to his friends. Friends have ability to accept or deny the invitaions. A user can also send friend request to other users whereas a friend can accept or deny the friend request. Look up mechanism of the app helps the users to look for events to attend and to search a friend. 

User's Event Page displays hosted events, hosting events, attended events, attending events, invited events. A user can view his friend's event page which shows events the friend is attending and hosting.

Even Lite is live here[https://event-lite.herokuapp.com/]

Features of the app:

* Authentication mechanism

* Look up mechanism for events and friends or other users of the app

* Sending event invitations to friends

* Accepting or Declining event invitation

* Sending friend request

* Accepting or Declining friend request

* Ability to manage the events

* Users can view event page of their friends

Implementation details of the app:

* Used Devise for authentication system

* Customized Devise for adding attributes for user model

* Bootstrap for styling the app also app is mobile friendly

* Followed TDD methodologies

* Used rspec, capybara, factory girl, faker, shoulda-matchers, guard

* Implemented 'Search mechanism' for events

* Implemented self referential associations for user and friendship model

* Look up for friends using first name, last name or email

* Added Ajax for searching mechanism of the events and friends(submission and display of the events and friends list)

* Added spinner which shows up while waiting through ajax 

* Added ajax for accepting or declining the event invitations

* Added ajax for accepting or declining the friend request
