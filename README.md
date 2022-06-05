# README

This events application was built in Ruby on Rails. It uses devise for authentication and has four tables with associations:

- Users
- Events
- Attendings
- Invites

User experience:
- Users that are not logged in can browse events and view each one, and sign up for an account.
- Users that are logged in can also create/edit/cancel events, invite others users, attend events, and view a dashboard showing their own events, upcoming/past events they attended.
- Events can be made private, so attendance is through invite only. These invites show in the user dashboard.

This was a fun project that required a solid understanding of routes, MVC and active record associations. Design was acheived using CSS framework Bulma. 
# Potential Improvements
I decided to go the more complicated route of using custom names in my associations, rather than tablename_id in my associations. This means the associations are a little more intricate to set up, but does give the benefit of sensical naming when calling active record methods. 

I also decided to use an invites join table to allow invite functionality. While this allows for separation of invites from events, and management of them both, it also means more code and multiple clicks for the user (join event, and remove invite).

In retrospect, you could include both invites and event attendings in one table and differentiate between the two with an 'invite_accepted' column that is boolean. When an event creator wants to send an invite, it creates a record in this table with the invitee user_id and invite_accpted set to false. Logic then shows this invite to the invitee user when they log on. If they accept, in one click they can set the accepted_invite value to true, and logic then shows this event in their dashboard. If they click deny, it deletes this record in the table. If a user attends an open event before an invite is sent, then logic removes the invite button from the event creator. This approach acheives the same goal with less code (routes, model, controller and view logic) and provides a better user experience.

View live: https://powerful-ridge-55376.herokuapp.com/

Screenshot:
![Screenshot](./screenshot.png?raw=true "")
