count := 1.0. "start count from 1"
[count <= 100] whileTrue:[ "keep looping until all 100 elements are printed"
    (count \\ 3.0 = 0.0)   
         ifTrue: [ 
                 (count \\ 5.0 = 0.0) 
                     ifTrue: [ 'fizzbuzz' printNl ] "if divisible by 3 and 5 then output FizzBuzz"
                     ifFalse: [ 'fizz' printNl ]. "if divisible only by 3 print fizz"
                 ]
         ifFalse: [
                  (count \\ 5.0 = 0.0)
                      ifTrue: [ 'buzz' printNl ] "if divisible by 5 print buzz"
                      ifFalse: [ count printNl ]. "if not divisible by 3 or 5 print the number"
         ].     
    count := count + 1.0. "increment to get next value"
    ].

