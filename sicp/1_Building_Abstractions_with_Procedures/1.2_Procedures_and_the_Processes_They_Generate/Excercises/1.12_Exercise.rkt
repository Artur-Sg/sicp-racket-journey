#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

#|
The following pattern of numbers is called Pascal's triangle.
                1
            1        1
        1       2       1
    1       3        3      1
1       4       6       4       1

The numbers at the edge of the triangle are all 1, 
and each number inside the triangle is the sum of the two numbers above it.
Write a procedure that computes elements of Pascal's triangle by means of a recursive process. 
|#

(define (pascal-triangle n m)
    (cond
        ((or
            (= m 1)
            (= m n)
            (and (<= m 2) (<= n 2))) 1
        )
        (else (+
            (pascal-triangle (- n 1) (- m 1))
            (pascal-triangle (- n 1) m)))
    )
)

(run-tests (test-suite "Excercise 1.12"
    (test-case "Pascal Triangle"
        (test-equal? "Check pascal-triangle procedure, positive case" 
            (list (pascal-triangle 1 1) (pascal-triangle 2 2) (pascal-triangle 3 2) 
                    (pascal-triangle 4 2) (pascal-triangle 5 2) (pascal-triangle 5 3)) 
            (list 1 1 2 3 4 6)
        )
    )
))
