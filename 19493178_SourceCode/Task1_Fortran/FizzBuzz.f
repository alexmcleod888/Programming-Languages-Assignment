      program FizzBuzz
      
c real values that determine whether there is a fizz or buzz
c when they equal 0 it means they occur, otherwise they do not
      real fizzCheck, buzzCheck
        
c this is a while loop that goes from 1 to 100
c   10 if (counter .LE. 100) then
      do 10 i = 1, 100
c compute the fizz and buzz check variables
c negate the integer division from the real division to detemine if
c there is a remainder, < 0 there is remainder, = 0 there isnt
          fizzCheck = dble(i)/3.0 - dble(i/3)
          buzzCheck = dble(i)/5.0 - dble(i/5)

c if both fizz and buzz check equal 0 then current number is a 
c multiple of both 3 and 5, hence print FizzBuzz
          if((fizzCheck .EQ. 0.0) .AND. (buzzCheck .EQ. 0.0)) then
              write (*,*) 'FizzBuzz'  
c if just fizz check is equal to 0 then print Fizz
          elseif (fizzCheck .EQ. 0.0) then 
              write (*,*) 'Fizz'
c if just buzz check is equal to 0 then print Buzz              
          elseif (buzzCheck .EQ. 0.0) then
              write (*,*) 'Buzz'
          else
c if both dont equal 0 then number isnt a multiple of either so print
c just print the number                  
              write (*,*) i
          endif

c increment the counter to go to the next number
c          counter = counter + 1
c go back to the start of the loop          
c          goto 10
c      endif
   10 continue

      stop
      end

