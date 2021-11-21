#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

(run-tests
    (test-suite "1.1.3  Evaluating Combinations"
        #:before (lambda () (display "1.1.3 Evaluating Combinations tests\n"))
        (test-case "To evaluate a combination, do the following:
                    1. Evaluate the subexpressions of the combination.
                    2. Apply the procedure that is the value of the leftmost subexpression (the operator) 
                    to the arguments that are the values of the other subexpressions (the operands).
                    Thus, the evaluation rule is recursive in nature;"
            (test-equal? "Deeply nested combination process could be represented in the form of a tree"  (* (+ 2 (* 4 6))(+ 3 5 7)) 390)
        )
    )
)
