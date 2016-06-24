[ ![Codeship Status for Aslonski/Global-Host](https://codeship.com/projects/060ac680-1862-0134-3b27-2a776fb5d411/status?branch=master)](https://codeship.com/projects/158675)

# Global-Host
Friends in far places
DBC - Final Project

<table>
  <tr>
  <th colspan="7">Team Members</th>
  </tr>

  <tr>
  <td><a href="https://github.com/phdewitte">Patrick Dewitt </a></a></td>
  <td><a href="https://github.com/Aslonski">Andrey Slonski</a></a></td>
  <td><a href="https://github.com/rmdemp">Ryan Dempsey</a></td>
  <td><a href="https://github.com/gabezurita">Gabriel Zurita</a></td>
</table>

## Project Description ##

Global Host links city guides and visitors.

### How to instal the code locally

1. Clone the repository.
2. Install the required gems: `bundle install`.
3. Set up the database: `bundle exec rake db:setup`
4. Start the application: `bundle exec rails server`

## How to use the app ##
### User Stories:

-As a visitor
  -As a user I want to be able to register as a visitor or a host
  -As a visitor, I want to see a list of available hosts in my destination city
  -As a visitor, I want to be able to search for someone in my destination city who has the same interests as me.
  -As a visitor, I want to be able to click on a host and see their detailed profile
  -As a visitor/host, I want to be able to contact a host (via internal message)
  -As a visitor, within a contact message, I want to be able to initiate an itinerary with a basic desired outline
  -As a visitor, I want to check back in at my accommodation to finalize the day
-Guide/Host
  -As a user I want to be able to register as a host to show people around my city
  -As a host, I want to be contacted by visitors who want to visit my home town.
  -As a host I want to be able to see the visitors itinerary, and edit it if needed
  -As a host, I want to be able to provide detailed information on items in a visitor's itinerary
  -As a host, I want to be able to view a visitor's profile
