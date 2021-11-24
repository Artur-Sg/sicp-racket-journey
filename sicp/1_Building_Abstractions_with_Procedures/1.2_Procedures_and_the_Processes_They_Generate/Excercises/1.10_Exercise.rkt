#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

;; Ackermann's function

(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1)))
        )
    )
)

;; Consider the following procedures, where A is the procedure defined above: 

(define (f n) (A 0 n)) ;; f(n) = 2n

(define (g n) (A 1 n)) ;; g(n) = 4n

(define (h n) (A 2 n)) ;; h(n) = 

#| 
Give concise mathematical definitions for the functions computed by the procedures f, g, and h 
for positive integer values of n. 
For example: (define (k n) (* 5 n n)) ;; k(n) = 5n^2
|#

(run-tests
    (test-suite "Exercise 1.9"
        #:before (lambda () (display "Exercise 1.9 tests\n"))
        (test-case "Exercise 1.9"
            (test-equal? "Ackermann's function" 
                (list (A 1 10) (A 2 4) (A 3 3)) 
                (list 1024 65536 65536))
            (test-equal? "f(n) = 2n" 
                (list (f 2) (f 4) (f 8) (f 10)) 
                (list 4 8 16 20))
            (test-equal? "g(n) = 2^n" 
                (list (g 2) (g 4) (g 8) (g 10)) 
                (list 4 16 256 1024))
            (test-equal? 
                "h(n) = 2^n, where n = 2^(2^(2^(2...(n - 1 times), n>1, h(4) = 2^((2^2)^2) = 2^(4^2) = 2^16" 
                (list (h 0) (h 1) (h 2) (h 3) (h 4)) 
                (list 0 2 4 16 65536))
        )
    )
)