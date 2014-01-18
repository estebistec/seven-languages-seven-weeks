NumberGuessingGame := Object clone do (

  minNumber := 1
  maxNumber := 100
  guessesAllowed := 10

  _setUp := method(
    // TODO parameterize guessing range
    self answer := Random value(minNumber, maxNumber + 1) floor
    self guesses := 0
    self lastGuess := nil
    self lastDistance := nil
  )

  // TODO break out more methods
  play := method(
    self _setUp
    writeln("Answer is #{answer}" interpolate)
    writeln("Guess a number between #{minNumber} and #{maxNumber}. You get #{guessesAllowed} guesses." interpolate)

    while(self guesses < guessesAllowed,
      self guesses = self guesses + 1
      // TODO handle bad input
      // TODO handle repeat guesses
      guess := File standardInput readLine("Guess ##{guesses}: " interpolate) asNumber
      distance := (answer - guess) abs

      if(guess == answer,
        // TODO pluralize "guesses"
        writeln("You got it! You took #{guesses} guesses!" interpolate)
        return
      )
      if(lastGuess == nil,
        writeln("Wrong"),
        if(guesses < guessesAllowed,
          if(distance <= lastDistance,
            writeln("Warmer!"),
            writeln("Colder :/")
          )
        )
      )
      lastGuess = guess
      lastDistance = distance
    )

    writeln("Sorry! You ran out of guesses. The number was #{answer}" interpolate)
    if(lastDistance == 1, writeln("You nearly had it!"))
    if(lastDistance == 2, writeln("You got pretty close!"))
  )
)

NumberGuessingGame clone play
