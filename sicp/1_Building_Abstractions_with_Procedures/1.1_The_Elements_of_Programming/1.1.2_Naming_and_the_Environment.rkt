#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

(define size 2)
(define pi 3.14159)
(define radius 10)
(define circumference (* 2 pi radius))

(run-tests
    (test-suite "1.1.2 Naming and the Environment"
        #:before (lambda () (display "1.1.2 Naming and the Environment tests\n"))
        (test-case "define is simplest means of abstraction, it allows to use simple names to refer to the results"
            (test-equal? "size will return 2 because it was previously defined"  size 2)
            (test-equal? "Usage in expressions"  (* 5 size) 10)
            (test-equal? "Another example with circle area"  (* pi (* radius radius)) 314.159)
            (test-equal? "And example with circumference - we can also define expressions"  circumference 62.8318)
        )
    )
)
