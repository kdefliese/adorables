# adorables

### The internet was made for cute animals. Adorables is a place to share all your favorite cute animal links with your friends. A link a day keeps the sad away!

- This application currently uses OAuth with Github (with the omniauth-github gem)
  - Please register your own application with Github and enter the Github Key and Github Secret in the .env file.
    - Don't push the .env file to github. Keep it secret, keep it safe.
    - The dotenv-rails gem manages loading environment variables from the .env for Omniauth in development, so no sweat!
  - Set your app callback to `http://localhost:3000/auth/github/callback` for development.
  - More information here [Github OAuth Docs](https://developer.github.com/v3/oauth/)
  - More information here [Omniauth](https://github.com/intridea/omniauth)
  - More information here [Omniauth-github](https://github.com/intridea/omniauth-github)

## Upcoming Features and Additions
- User Profile
  - User's links
  - User info
  - User's hearted links
- New and improved aesthetic
- OAuth with GOOGLE??
- List of people who hearted an image
- RSpec all the things
- Ability to add video links
- Ability to upload photos
- Favoriting a link

🐳,

Daphne
