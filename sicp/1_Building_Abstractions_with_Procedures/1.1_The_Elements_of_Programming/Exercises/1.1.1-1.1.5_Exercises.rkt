#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

;;Exercise 1.1

(define a 3)
(define b (+ a 1))


;; Exercise 1.3

(define (square x) (* x x))

(define (sum-of-squares x y)(+ (square x) (square y)))

(define (sum-max-squares m n k)
    (cond ((and (<= m n) (<= m k)) (sum-of-squares n k))
        ((and (<= n m) (<= n k)) (sum-of-squares m k))
        ((and (<= k m) (<= k n)) (sum-of-squares m n))
        (else '())
    )
)


;; Exercise 1.4

(define (a-plus-abs-b q w)
    ((if (> w 0) + -) q w)
)


;; Exercise 1.5

#| Ben's procedure to check evaluation which uses an intepreter:

(define (p) (p))
(define (test x y)
    (if (= x 0)
        0
        y
    )
)
(test 0 (p))

    What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
    Using applicative-order evaluation, the evaluation of (test 0 (p)) never terminates, because (p) is infinitely expanded to itself:

    What behavior will he observe with an interpreter that uses normal-order evaluation?
    Using normal-order evaluation, the expression evaluates, step by step, to 0: 
|#


(run-tests
    (test-suite "Exercises"
        #:before (lambda () (display "Exercise 1.1-1.4 tests\n"))
        (test-case "Exercise 1.1"
            (test-equal? "Get number back"  10 10)
            (test-equal? "5 + 3 + 4 = 12" (+ 5 3 4) 12)
            (test-equal? "9 - 1 = 8" (- 9 1) 8)
            (test-equal? "6 / 2 = 3" (/ 6 2) 3)
            (test-equal? "(2 * 4) + (4 - 6)" (+ (* 2 4) (- 4 6)) 6)
            (test-equal? "a + b + a * b" (+ a b (* a b)) 19)
            (test-equal? "a == b is False" (= a b) #f)
            (test-equal? "a > b and b < a * b" (if (and (> b a) (< b (* a b))) b a) b)
            (test-equal? "Check condition #1" (cond ((= a 4) 6)((= b 4) (+ 6 7 a))(else 25)) 16)
            (test-equal? "Check condition #2" (+ 2 (if (> b a) b a)) 6)
            (test-equal? "Check condition #3" (* (cond ((> a b) a) ((< a b) b) (else -1))(+ a 1)) 16)
        )
        (test-case "Exercise 1.2"
            (test-equal? "Translate the following expression into prefix form" ( / (+ 5 4 ( - 2 ( - 3( + 6 ( / 4 5))))) (* 3 (- 6 2) (- 2 7))) -37/150)
        )
        (test-case "Exercise 1.3 Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers"
            (test-equal? "#1" (sum-max-squares 1 2 3) 13)
            (test-equal? "#2" (sum-max-squares 4 2 3) 25)
            (test-equal? "#3" (sum-max-squares 0 0 0) 0)
            (test-equal? "#4" (sum-max-squares 1 0 1) 2)
            (test-equal? "#5" (sum-max-squares 2 3 0) 13)
        )
        (test-case "Exercise 1.4.  Observe that our model of evaluation allows for combinations whose operators are compound expressions.
                    Use this observation to describe the behavior of the following procedure:"
            (test-equal? "#1" (a-plus-abs-b 3 4) 7)
            (test-equal? "#2" (a-plus-abs-b 3 -4) 7)
        )
    )
)