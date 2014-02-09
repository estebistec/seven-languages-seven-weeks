NumberGuessingGame := Object clone do (

  minNumber := 1
  maxNumber := 100
  guessesAllowed := 10

  setUp := method(
    // TODO parameterize guessing range
    self answer := Random value(minNumber, maxNumber + 1) floor
    self guesses := 0
    self lastGuess := nil
    self lastDistance := nil
  )

  play := method(
    self _tellDirections

    while(lastGuess != answer and self guesses < guessesAllowed,
      self guesses = self guesses + 1
      guess := self _askNextGuess(guesses)
      self _checkGuess(guesses, guess)
    )
    if(lastGuess == answer,
      self _tellWon,
      self _tellLost
    )
  )

  _tellDirections := method(
    // TODO pluralize "guesses"
    writeln("Guess a number between #{minNumber} and #{maxNumber}. You get #{guessesAllowed} guesses." interpolate)
  )

  _askNextGuess := method(guessNumber,
    // TODO handle bad input
    // TODO handle repeat guesses
    return File standardInput readLine("Guess ##{guessNumber}: " interpolate) asNumber
  )

  _checkGuess := method(guessNumber, guess,
    distance := (answer - guess) abs

    if(guess != answer,
      if(lastDistance != nil and guessNumber < guessesAllowed,
        if(distance <= lastDistance,
          writeln("Warmer!"),
          writeln("Colder :/")
        ),
        writeln("Wrong")
      )
    )
    lastGuess = guess
    lastDistance = distance
  )

  _tellWon := method(
    // TODO pluralize "guesses"
    writeln("You got it! You took #{guesses} guesses!" interpolate)
  )

  _tellLost := method(
    writeln("Sorry! You ran out of guesses. The number was #{answer}" interpolate)
    if(lastDistance == 1, writeln("You nearly had it!"))
    if(lastDistance == 2, writeln("You got pretty close!"))
  )
)

NumberGuessingGame clone do (
  setUp
  play
)
