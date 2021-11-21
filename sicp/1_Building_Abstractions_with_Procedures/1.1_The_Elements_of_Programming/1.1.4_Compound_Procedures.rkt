#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

(define (square x) (* x x))
(define (sum-of-squares x y)(+ (square x) (square y)))
(define (f a)
    (sum-of-squares (+ a 1) (* a 2)))

(run-tests
    (test-suite "1.1.4  Compound Procedures"
        #:before (lambda () (display "1.1.4  Compound Procedures tests\n"))
        (test-case "Compound procedures are used in exactly the same way as primitive procedures."
            (test-equal? "Test example of procedure definitions on squaring procedure 4^2 = 16"  (square 4) 16)
            (test-equal? "21^2 = 441"  (square 21) 441)
            (test-equal? "(2 + 5)^2 = 49"  (square (+ 2 5)) 49)
            (test-equal? "(3^2)^2 = 81"  (square (square 3)) 81)
            (test-equal? "We can use one procedure as a block in defining other procedures"  (sum-of-squares 3 4) 25)
            (test-equal? "we can use sum-of-squares as a building block in constructing further procedures"  (f 5) 136)
            )
    )
)