#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

;; Fibonacci 

(define (fib n)
    (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))
    )
)

#|
fib procedure calls itself twice each time it is invoked 
and it is a terrible way to compute Fibonacci numbers
because it does so much redundant computation 
and the value of fib(n) steps grows exponentially with n
|#

(define (fib_2 n)
    (define (fib_iter a b count)
        (if (= count 0) 
            b 
            (fib_iter (+ a b) a (- count 1))))
    (fib_iter 1 0 n)
)

#|
The idea of the second procedure fib_2 is to use a pair of integers a and b, 
initialized to Fib(1) = 1 and Fib(0) = 0, and to repeatedly apply the simultaneous transformations
and after applying this transformation n times, a and b will be equal, respectively, to Fib(n + 1) and Fib(n)
fib_2 procedure is a linear iteration. 

The difference in number of steps required by the two methods -- one linear in n (fib_2), 
one growing as fast as Fib(n) itself (fib)
|#


;;Counting change

#|
How many different ways can we make change of $ 1.00 (100), 
given half-dollars (50), quarters (25), dimes (10), nickels (5), and pennies (1)? 
|#

(define (count-change amount)
    (cc amount 5))
    
(define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
            ((or (< amount 0) (= kinds-of-coins 0)) 0)
            (else (+ (cc amount
                    (- kinds-of-coins 1))
                        (cc (- amount 
                                (first-denomination kinds-of-coins))
                            kinds-of-coins)
                ))
    )
)

;; The first-denomination procedure takes as input the number of kinds of coins available
;; and returns the denomination of the first kind.
(define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)
        (else 0)
    )

)


(run-tests (test-suite "1.2.2 Tree Recursion"
    (test-case "Fibonacci procedures test"
        (test-equal? "Fibonacci ineffective function test" 
            (list (fib 0) (fib 1) (fib 2) (fib 3) (fib 4) (fib 5) (fib 6) (fib 7) (fib 10)) 
            (list 0 1 1 2 3 5 8 13 55)
        )
        (test-equal? "Fibonacci effective function test" 
            (list (fib_2 0) (fib_2 1) (fib_2 2) (fib_2 3) (fib_2 4) (fib_2 5) (fib_2 6) (fib_2 7) (fib_2 10)) 
            (list 0 1 1 2 3 5 8 13 55)
        )
    )
    (test-case "Сount-change"
        (test-equal? "Сount-change procedure test" 
            (list (count-change 1)  (count-change 10) (count-change 25) (count-change 100)) 
            (list 1 4 13 292)
        )
    )
))

