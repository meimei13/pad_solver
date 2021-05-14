# 🐉 PadSolver 🐉

PadSolver is a web based puzzle and dragons simulator and solver. It's written in Elixir and Elm using the Phoenix web framework.
As a functional exercise, I tried to avoid using Javascript where I could, and instead opted to use Elm on the front end. Elm
is derived from Haskell and compiles down to Javascript. To avoid too many round trips between the front-end and the Phoenix backend,
all of the page events, animations, orb movements, and board solving is loaded onto the client end with Elm.

## Usage

To start the application:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now visit [`localhost:4000`](http://localhost:4000) from your browser.

## Todos

Currently, the application only generates random boards. Next few steps are:

1. Create a JS event pipeline and have Elm receive the events from a port. Use this to handle onClick and onDrag events to move orbs around
2. Update board logic to only randomize boards with no adjacent matching orbs; implement within the Random monad
3. Create a monad that describes how boards should match and use that to clear matching orbs from the board
4. Attempt to brute force solve boards by generating possible solutions by starting from a corner orb. Sort solutions by largest combo count

## Acknowledgements

Shoutout to https://pad.dawnglare.com/ for writing the OG Javascript PAD simulator
