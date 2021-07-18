# Q/A
## What's this?
This is a rewrite of our school project from the ground up to use bootstrap and ruby on rails.

## Why did you rewrite our school website?
Because it is less effort for a superior result

## How can I view this website?
Download this repo, cd into FRANKLIN/website-snapshot and run `python -m http.server` then go to `http://127.0.0.1:8000` (or whatever your url is) and it should show a demo.

## But where did my css go?
In no particular order:
 * The information page was unwieldy and not designed well for ruby
 * The landing page was preventing people from getting to the content of our webpage immediately, however this could be brought back
 * The navbar was unwieldy from a backend perspective, and not suited to navigating between multiple urls (something we are now doing)
 * The navbar also took up too much room, especially on mobile
 * The animations for switching pages do not support multiple urls (once again, something we are now doing)
 * Keeping the css would, to be honest, require more work than redoing from scratch with bootstrap for a superior result

## The navbar looks ugly.
Yes, but
 * It supports mobile
 * It is easily expandable
 * I can add a theme to make it better easily

## Why are there more pages on the navbar?
 * Home is the home page (`/`)
 * Logout is for the user account system I set up (`/logout`)
 * Tour is for the School View ('/tour')
 * Map is for the School Map linking to the School View (`/map`)
 * Articles is to access the articles (`/articles/[article number]`, `/articles`)
 * Forum is for the forum I want to add (`/forum`)
THIS ALL WORKS ON MOBILE (EXCEPT PANNELLUM)

## Accounts? Forums? Comments?
These have three purposes:
 * To flex our database to earn more marks
 * To become a social media service, as every website must eventually become
 * To collect emails

## Bootstrap?
It's a css library, like material, except more popular.

## What can I do on the project?
 * Continue updating streetview.js.
 * Make the map feature.
 * Follow the guide below on how to write articles.

### How to write articles
1. Follow the *How can I view this website* above.
2. There should be two `div`s - one with `FRANKLIN, PUT THE TITLE HERE!` inside and one with `FRANKLIN, PUT THE CONTENT HERE!`.
3. Put the title inside the first div, and the content inside the second. IMPORTANT - DON'T EDIT ANYTHING OUTSIDE OF THOSE DIVS!
4. Send me the html that you put inside, as well as the title

## If you need anything else, send me an email. I'll check my email. Probably.