/*purpose: rule that checks whether X is divisble by 3 
 *         if true then Fizz it output to console      */
fizzbuzzCheck(X) :- 
    Y is X//3, X =:= 3 * Y, Z is X//5, \+ (X =:= 5 * Z),
    write('Fizz'), nl.

/*purpose: rule that checks whether X is divisble by 5
 *         if true then Buzz is output to the console  */
fizzbuzzCheck(X) :- 
    Y is X//5, X =:= 5 * Y, Z is X//3, \+ (X =:= 3 * Z),
    write('Buzz'), nl.

/*purpose: rule that checks whether X is divisible by 3 and 5
 *         if true then FizzBuzz is printed to the console    */
fizzbuzzCheck(X) :-
    Y is X//3, X =:= 3 * Y, Z is X//5, X =:= 5 * Z,
    write('FizzBuzz'), nl.

/*purpose: rule that checks whether X isn't divisible by 3 or 5
 *         if true then the current number is just printed     */
fizzbuzzCheck(X) :- 
    Y is X//3, \+ (X =:= 3 * Y), Z is X//5, \+ (X =:= 5 * Z),
    format('~d ~n', [X]).

/*purpose: this rule checks the current number for fizz and buzz, it then
 *         increments it and if this number is less then or equal to 1000
 *         increment is called again on the new incremented number. Otherwise
 *         it does not recall increment.                                     */
increment(X) :-
    fizzbuzzCheck(X),
    succ(X, Y),
    Y =< 1000,
    increment(Y).

/*purpose: this is the starting rule that begins the incrementation at 1*/
startFizzBuzz :-
    increment(1).
