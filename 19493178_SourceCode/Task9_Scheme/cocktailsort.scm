; Author : Alex McLeod
; Purpose : performs cocktail sort on a list of items, algorithm alternates between cocktail-sort-right and cocktail-sort-left, performing bubble sort from
;           left to right and then right to left.


;purpose: swaps the first two elements of a list
(define swap (lambda (x)
	       (reverse (list (car x) (cadr x)))))

;purpose: swaps first two elements of list, removes the first element from list and returns the rest of the list
(define next (lambda (x)
	       (cdr (append (swap x) (cddr x)))))

;purpose: swaps first two elements of input list, saves first element of list by adding to list y and returns list y 
(define save (lambda (x y)
	       (append y (list (car (swap x))))))

;purpose: performs bubble-sort from right to left of list, first occurence occurs after cocktail-sort-right
;x : current list of element to perform bubble sort, first item is continually removed as functions recurses
;y : used to save the list of elements that have already been traversed, one item is added to list as function recurses
;s : used to hold the number of swaps that have occurred during one recurse from the left to right
;l : used to hold the length of the initial input list
(define cocktail-sort-left (lambda (x y s l)
                        (if (= 1 l) ; if there is one item left in the list we have finished right-left traversal, so check num swaps
                           (if (= 0 s) ; if num swaps is 0 list has been sorted so output otherwise bubble-sort from left to right
                               (reverse (append y x)) ; need to output the reverse list as input was reversed upon entering cocktail-sort-left
                               (cocktail-sort-right (reverse (append y x)) '() 0 (length (append y x)))) ; perform bubblesort left to right
                           (if (< (car x) (cadr x)) ; if first item is greater then second item perform swap otherwise move to the right
			       (if (= 2 (length x)) ; if only two items left in list x just swap dont need to append back
                                   (cocktail-sort-left (cdr (swap x)) (save x y) (+ s 1) (- l 1))
                                   (cocktail-sort-left (next x) (save x y) (+ s 1) (- l 1)))
                               (cocktail-sort-left (cdr x) (append y (list (car x))) s (- l 1)))))) ; move to the right of list by removing first item

;purpose: performs bubble-sort from left to right of list 
;x : current list of element to perform bubble sort, first item is continually removed as functions recurses
;y : used to save the list of elements that have already been traversed, one item is added to list as function recurses
;s : used to hold the number of swaps that have occurred during one recurse from the left to right
;l : used to hold the length of the initial input list
(define cocktail-sort-right (lambda (x y s l)
			(if (= 1 l) ; if there is one item left in the list we have finished left-right traversal, so check num swaps
			   (if (= 0 s) ; if num swaps is 0 list has been sorted so output otherwise bubble-sort from right to left
			       (append y x) ; append last item to the end of the saved list and return
			       (cocktail-sort-left (reverse (append y x)) '() 0 (length (append y x)))) ; perform bubblesort right to left
			   (if (> (car x) (cadr x)) ; if first item is greater then second item perform swap otherwise move to the right
			       (if (= 2 (length x)) ; if only two items left in list x just swap dont need to append back
				   (cocktail-sort-right (cdr (swap x)) (save x y) (+ s 1) (- l 1)) 				   
			           (cocktail-sort-right (next x) (save x y) (+ s 1) (- l 1)))
				   
			       (cocktail-sort-right (cdr x) (append y (list (car x))) s (- l 1)))))) ; move to the right of list by removing first item
			       
			       

(define cocktail-sort (lambda (x) 
			(if (>= (length x) 1) 
			    (cocktail-sort-right x '() 0 (length x))
			    (begin 
			      (newline (current-output-port))
			      (display "input is empty" (current-output-port))
			      (newline (current-output-port)))))) ; function that starts algorithm by calling cocktail sort
			      
;input tests
;test set of numbers
(cocktail-sort '(3 1 5 2)) 

;test empty input
(cocktail-sort '())

;test one number
(cocktail-sort '(1))

;numbers in descending order
(cocktail-sort '(5 4 3 2 1))

;list containing the same number twice
(cocktail-sort '(5 2 2 1 9 3))

;test already sorted list
(cocktail-sort '(1 2 3 4 5))



