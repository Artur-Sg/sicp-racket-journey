#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

#|
A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3. 
Write a procedure that computes f by means of a recursive process. 
Write a procedure that computes f by means of an iterative process. 
|#


;; Procedure with recursive process
(define (f n)
    (cond ((< n 3) n)
        (else (+ 
                (f (- n 1))
                (* 2 (f (- n 2)))
                (* 3 (f (- n 3)))
            )
        )
    )
)

;; Procedure with iterative process
(define (f_i n)
    (define (f_iter f-1 f-2 f-3 counter)
        (define fi (+ f-1 (* 2 f-2) (* 3 f-3)))
        (if (= counter n) 
            fi
            (f_iter fi f-1 f-2  (+ counter 1))
        )
    )
    ;; initial values: f(3) with f(2) = 2, f(1) = 1, f(0) = 0 and counter = 3
    (if (< n 3) n (f_iter 2 1 0 3))
)

(run-tests (test-suite "Excercise 1.11"
    (test-case "Recursive process"
        (test-equal? "Check f function procedure" 
            (list (f 1) (f 2) (f 3) (f 4) (f 5) (f 6) (f 7)) 
            (list 1 2 4 11 25 59 142)
        )
    )
    (test-case "Iterative process"
        (test-equal? "Check f_i function procedure" 
            (list (f_i 1) (f_i 2) (f_i 3) (f_i 4) (f_i 5) (f_i 6) (f_i 7)) 
            (list 1 2 4 11 25 59 142)
        )
    )
))






