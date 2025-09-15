# Mastermind Game
A Ruby implementation of the classic Mastermind code-breaking game, played from the command line.

## About Mastermind
Mastermind is a code-breaking game where one player creates a secret code and the other player tries to guess it within a limited number of turns. After each guess, the code-maker provides feedback about how close the guess was to the secret code.

## How to Play
The secret code consists of 4 colors chosen from: red, blue, green, yellow, and purple.
After each guess, you'll receive feedback:

- Exact matches: Colors that are correct and in the right position
- Partial matches: Colors that are in the code but in the wrong position

You have 12 turns to crack the code!

## Installation & Setup

1. Clone or download this repository
2. Make sure you have Ruby installed
3. Install dependencies:
```bash
bundle install
```
4. Run the game:
```bash
./bin/play_game
```

## Current Implementation Status
### ✅ Completed Features

- Core Game Logic: Fully functional Mastermind game
- Random Code Generation: Computer generates a random 4-color secret code
- Human Player Guessing: Player can input guesses via command line
- Input Validation: Ensures guesses are valid (4 colors from available options)
- Feedback System: Calculates and displays exact and partial matches
- Win/Lose Conditions: Game ends when code is cracked or turns run out
- Colorized Output: Uses the colorize gem for colored terminal output
- Turn Limit: 12 attempts to guess the code

### 🔧 Project Structure
```bash
├── bin/
│   └── play_game          # Executable to start the game
├── lib/
│   ├── game.rb           # Main game controller
│   ├── code.rb           # Secret code generation
│   ├── player.rb         # Player input handling
│   └── board.rb          # (placeholder for future features)
├── Gemfile               # Ruby dependencies
├── Gemfile.lock         # Locked dependency versions
└── README.md            # This file
```

### 🔄 Current Game Flow

1. Computer generates a secret 4-color code
2. Player enters their guess (space, comma, or  period separated)
3. Game validates the input
4. Game calculates exact and partial matches
5. Feedback is displayed to the player
6. Process repeats until win or 12 turns are exhausted

## Upcoming Features
### 🚧 In Development

- Role Selection: Allow player to choose between being the guesser or code-maker
- Computer Logic: Implement computer player that can guess human-created codes

## Technical Notes
### Dependencies

 - colorize gem for terminal color output
 - Ruby 2.7+ recommended

### Algorithm Highlights

- Exact Match Detection: Compares positions directly
- Partial Match Calculation: Uses array manipulation to avoid double-counting
- Input Parsing: Flexible input handling with multiple delimiters

## Game Rules Reference
### Traditional Mastermind Rules:

- Secret code has 4 positions
- 5 colors available (can repeat)
- 12 guesses maximum
- Feedback given as exact + partial matches
- No information about which specific positions are correct

This implementation follows traditional rules with minor adaptations for command-line play.