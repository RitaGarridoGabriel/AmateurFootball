# AmateurFootball

This application was developed in the curricular unit Databases - Bachelor's Degree in Informatics Engineering (University of Coimbra) course.
It's an online platform for amateur football players that:
- Gathers all the information about tournaments, teams and players stored in a **database** 
- Manage user's access and personal information
- Allows login and signup

The information is stored in a relational DBMS and managed using **SQL**.

# Pages
This application has 4 main pages:  **main page**, **administrator's page**, **login page** and **signup page**.

## index.php and index_logged.php
This are the application's main pages. The tournament's teams, games and classification table is presented to the user.
> **Note:** Only **logged users** can access player*s personal information
> 
## login.php
This the login page for registered users. (Verification user login credentials in the databse)

## signup.php
This the register page for unregistered users. (Is created a new entry in the database for that user)

## admin_page.php
This page is presented only for users with admin privileges and 
- see personal information of all users
- see users with tournament management privileges
- allows to block/unblock users
- allows to give/take tournament management privileges to users
- read system notifications and notifications from other users

# Database setup
1. Create a MySQL database using the createInsert.sql file
2. Place the contents of the repository in the xampp htdocs folder (or equivalent)
3. Change the php_functions / connect.php file with the username and password of a user of your database with privileges for the FutebolAmador database or create a new user with the credentials Username: rita and password : ritapass
4. Connect xampp's Apache and MySQL services (or equivalent)
5. Access the application through the browser at the address localhost/index.php
