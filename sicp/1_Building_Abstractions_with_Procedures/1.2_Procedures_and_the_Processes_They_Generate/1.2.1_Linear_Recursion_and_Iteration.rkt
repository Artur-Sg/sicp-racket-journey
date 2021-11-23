#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

;; n! =n·[(n−1)·(n−2)···3·2·1] =n·(n−1)!

#|
A linear recursive factorial procedure

This type of process, characterized by a chain of deferred operations, is called a recursive process. 
Carrying out this process requires that the interpreter keep track of the operations to be performed later on. 
In the computation of n!, the length of the chain of deferred multiplications, 
and hence the amount of information needed to keep track of it, grows proportional to n.
Such a process is called a linear recursive process.
|#

(define (factorial x)
    (if (= x 0)
        1
        (* x (factorial (- x 1)))))

#|
A linear iterative factorial procedure

This process does not grow and shrink. At each step, we need to keep track 
the current values of the variables product, counter, and max-count. 
It is an iterative process - is one whose state can be summarized by a fixed number of state variables, 
together with a fixed rule that describes how the state variables should be updated as 
the process moves from state to state and an (optional) end test 
that specifies conditions under which the process should terminate. 
In computing n!, the number of steps required grows linearly with n. 
Such a process is called a linear iterative process.
|#

(define (factorial-iterative n)
    (define (fact-iter product counter max-count)
        (if (> counter max-count)
            product
            (fact-iter (* counter product) 
                        (+ counter 1) 
                        max-count)))
    (fact-iter 1 1 n))

(run-tests
    (test-suite "1.2.1  Linear Recursion and Iteration"
        #:before (lambda () (display "1.2.1  Linear Recursion and Iteration tests\n"))
        (test-case "Check factorial procedures"
            (test-equal? "A linear recursive factorial process" 
                (list (factorial 0) (factorial 1) (factorial 2) (factorial 3) (factorial 4) (factorial 5)) 
                (list 1 1 2 6 24 120))
            (test-equal? "A linear iterative factorial process" 
                (list (factorial-iterative 0) (factorial-iterative 1) (factorial-iterative 2) 
                    (factorial-iterative 3) (factorial-iterative 4) (factorial-iterative 5)) 
                (list 1 1 2 6 24 120))
        )
    )
)

