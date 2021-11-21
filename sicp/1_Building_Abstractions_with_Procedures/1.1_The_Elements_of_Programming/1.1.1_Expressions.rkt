#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

(run-tests
    (test-suite "1.1 Expressions"
        #:before (lambda () (display "1.1.1 Expressions tests\n"))
        (test-case "If we give the interpreter a number it'll give this number back"
            (test-equal? "Will return the same"  486 486))
        (test-case "Number expressions may be combined with a primitive procedures (such as + or *).
                    Left one in the list is called operator (+ - / *),
                    other elements are called operands (values of operands are called arguments)"
            (test-equal? "137 + 349 = 486" (+ 137 349) 486)
            (test-equal? "1000 - 334 = 666" (- 1000 334) 666)
            (test-equal? "5 * 99 = 495" (* 5 99) 495)
            (test-equal? "10 / 5 = 2" (/ 10 5) 2)
            (test-equal? "10 + 2.7 = 12.7" (+ 2.7 10) 12.7)
        )
        (test-case "Expressions, formed by delimiting a list of expressions within parentheses are called combinations.
                    Placing the operator to the left of the operands is called prefix notation.
                    Prefix notation has several advantages. One of the advantage is that it may take an arbitrary number of arguments"
            (test-equal? "21 + 35 + 12 + 7 = 75" (+ 21 35 12 7) 75)
            (test-equal? "25 * 4 * 12 = 1200" (* 25 4 12) 1200)
        )
        (test-case "A second advantage of prefix notation is nested combinations. There is no limit to the depth of such nesting"
            (test-equal? "(3 * 5) + (10 - 6) = 19" (+ (* 3 5) (- 10 6)) 19)
            (test-equal? "(3 * ((2 * 4) + (3 + 5))) + ((10 - 7) + 6) = 57" (+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6)) 57)
        )
    )
)