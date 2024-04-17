## The House Always Wins

## Description

The Game App is a web application where users can play Slot Machine and earn credits.

### Dashboard Controller

The Dashboard controller handles user input for the unique username. Currently, authentication is not implemented, so only the username is used to identify the user. Upon entering a username, the user is awarded 10 credits, and the username is stored in the session.

### User Controller

The User controller is responsible for creating a session with the username and initializing the credit score for the user. It handles the logic related to user sessions and manages the user's credit score.

### Game Controller

The Game controller contains two actions: spin and cash out.

- The "spin" action triggers the spinning animation by setting the three boxes as 'X'. It sends a request to the backend to generate a randomized output.
- The "cash out" action stores the current credits of the user in the database.

### Stimulus Controller

The Stimulus controller named "Game" is responsible for handling the frontend interactions. It sends a request to the backend to retrieve the game results. Before receiving the response, it sets the three boxes as 'X', indicating that the spinning animation is in progress. Once the response is received, the results are displayed in each individual box, with a gap of 1 second between each box.

## Installation

To run the Game App locally, follow these steps:

1. Clone the repository:

   ```shell
   git clone http://userevidence-wkvatv@git.codesubmit.io/userevidence/the-house-always-wins-ggfomw
   ```

2. Install dependencies:

   ```shell
   cd game-app
   bundle install
   ```

3. Set up the database:

   ```shell
   rails db:create
   rails db:migrate
   ```

4. Start the Rails server:

   ```shell
   rails server
   ```

5. Access the application in your browser at `http://localhost:3000`.

## Running Specs
- bundle exec rspec

## Dependencies

The Game App has the following dependencies:

- Ruby (version 3.1.3)
- Ruby on Rails (version 7.0.6)
- Hotwire Stimulus (version 1.2.1)

## Trade Offs / improvements

1. Currently, the App does not implement authentication. Instead, it relies on the unique username provided by the user to identify each individual user. Even if the session is destroyed, users can retrieve their scores by using the same username again. Instead of doing this way we can use devise for authentication and store the credits of all users along with their other information.

2. As an alternative to using letter symbols, the App has the capability to incorporate visual images to represent various symbols, such as cherries, lemons, and other relevant icons. This enhancement can enhance the user interface and provide a more engaging and visually appealing experience for players.

3. At present, the App does not persist data for each spin. However, it is essential to note that in a production-ready deployment, it is recommended to implement data storage to ensure the preservation of spin records and provide a complete user experience.

4. Instead of displaying the letter "X" to indicate the spinning effect, the App can be enhanced to incorporate an actual spinning animation. This visual effect will add an immersive and dynamic element to the user interface, providing a more captivating and realistic spinning experience.

5. We can Implement role-based authorization. By implementing roles, such as an admin role, we can introduce additional capabilities and permissions. Admin users would have the privilege to perform various exciting tasks, including modifying symbols, adding new symbols, or adjusting winning credit scores. This feature enables greater flexibility and customization within the application, catering to different user roles and enhancing the overall user experience.
