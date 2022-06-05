# README

This events application was built in Ruby on Rails. It uses devise for authentication and has four tables with associations:

- Users
- Events
- Attendings
- Invites

User experience is as follows:
- Users that are not logged in can browse events and view each one, and sign up for an account.
- Users that are logged in can also create/edit/cancel events, invite others users, attend events, and view a dashboard showing their own events, upcoming/past events they attended.
- Events can be made private, so attendance is through invite only. These invites show in the user dashboard.

This was a fun project that required a solid understanding of routes, MVC and active record associations. Design was acheived using CSS framework Bulma. 

Screenshot:
![Screenshot](./screenshot.png?raw=true "")
