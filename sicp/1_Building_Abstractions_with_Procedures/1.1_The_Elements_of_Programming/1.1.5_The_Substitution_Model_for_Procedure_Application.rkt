#lang sicp


#| 1.1.5_The_Substitution_Model_for_Procedure_Application

    Lisp uses applicative order.

    Applicative order: 
        f(5) = sum_of_squares(5 + 1, 5 * 2) = 
            square(6) + square(10) = ((6 * 6) + (10 * 10)) = 
            36 + 100 = 136

    Normal-order evaluation: 
        f(5) = sum-of-squares (5 + 1, 5 * 2) = 
            square(5 + 1) + square(5 * 2) = ((5 + 1) * (5 + 1)) + ((5 * 2) * (5 * 2)) = 
            (6 * 6) + (10 * 10) = 36 + 100 = 136
|#