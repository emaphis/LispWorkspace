;;; COMMON LISP: A Gentle Introduction to Symbolic Computation
;;; Chapter 1 - Functions and Data

;;; 1.2 Functions on Numbers

(+ 3 4)

(abs -4)

;;; 1.3 Three kinds of numbers

;; integers, floating point,  ratios
2/3
3/4
(/ 3 6)
(/ 3 6.0)

;; 1.4 Order of inputs is important
(/ 2 8)
(/ 8 2)

(/ 10 8)


;;; Exercise

;; 1.1 Here are some function boxes with inputs and outputs. I

(+ 6 7)  ;; 13
(* 3 4)  ;; 12
(/ 16 8) ;; 2
(- 4 3)  ;; 1
(abs -3) ;; 3

;; more
(/ -8 6) ;; -4/3
(/ 15 9) ;; 5/3
(* 8 1)  ;; 8
(- 5 6)  ;; -1
(- 1 1/3)  ;; 2/3
(abs (+ -5 2)) ;; 3


;;; 1.5 Symbols

;;; 1.6 The Special Symbols 'T and 'NIL

;; True and False
t   ;; for true
nil ;; for false

;; Que cheesy Lisp joke


;;; 1.7 Some simple predicates

(numberp 2)
(numberp nil)

(symbolp 'cat)
(symbolp 5)

(zerop 35)
(zerop 0)

(oddp 1)
(evenp 4)

(< 2 3.0)
(> 2 3)


;;; 1.8 The Equal predicate

(equal 'cat 'mouse)
(equal 'cat 'cat)
(equal 3 3)


;;; Exercise

;; 1.3. Fill in the result of each computation:

(< 7 11)   ;; 'T
(oddp 12)  ;; 'NIL
(equal 'kirk 'spock)  ;; 'NIL
(numberp 'twelve)  ;; 'NIL
(< -4 -3)  ;; 'T
(zerop 0)  ;; 'T


;;; 1.9 Putting functions together

;; 1.9.1 Defining add1
(defun add1 (x)
  (+ x 1))

(add1 5)

;; 1.9.2 Defining ADD2

(defun add2 (x)
  (add1 (add1 x)))

(add2 5)

;; 1.9.3 Defining TWOP

(defun twop (n)
  (equal 2 n))

(twop 2)
(twop 3)


;;; Exercises

;; 1.4 Define a SUB2 function that subtracts two from its input.
(defun sub2 (n)
  (- n 2))

(sub2 5)


;; 1.5 Show how to write TWOP in terms of ZEROP and SUB2
(defun twop-2 (n)
  (zerop (sub2 n)))

(twop-2 2)
(twop-2 3)

;;1.6 The HALF function returns a number that is one-half of its input. Show
;;     how to define HALF two different way
(defun half (n)
  (/ n 2))

(defun half-2 (n)
  (* 1/2 n))

(half 8)
(half-2 8)

;; 1.7 Write a MULTI-DIGIT-P predicate that returns true if its input is
;;     greater than 9
(defun multi-digit-p (n)
  (> n 9))

(multi-digit-p 5)
(multi-digit-p 10)
(multi-digit-p 15)

;; 1.8. What does this function do to a number?
(defun negative (n)
  (- 0 n))

(negative 5)


;; 1.9.4 Defining ONEMOREP
(defun onemorep (x y)
  (equal x (add1 y)))

(onemorep 7 6)
(onemorep 7 3)
(onemorep 7 7)


;;; Exercises

;; 1.9 Write a predicate TWOMOREP that returns T if its first input is exactly
;;     two more than its second input. Use the ADD2 function in your
;;     definition of TWOMOREP

(defun twomorep (n m)
  (equal n (add2 m)))

(twomorep 4 2)
(twomorep 2 4)

;; 1.10. Find a way to write the TWOMOREP predicate using SUB2 instead of
;;       ADD2.
(defun twomorep-2 (n m)
  (equal (sub2 n) m))

(twomorep-2 4 2)
(twomorep-2 2 4)

;; 1.11. The average of two numbers is half their sum. Write the AVERAGE
;;       function.
(defun average (n m)
  (half (+ n m)))

(average 2 4)
(average 3 7)

;; 1.12. Write a MORE-THAN-HALF-P predicate that returns T if its first input
;;       is more than half of its second input.

(defun more-than-half-p (n m)
  (> (half n) m))

(more-than-half-p 3 7)
(more-than-half-p 6 3)
(more-than-half-p 7 3)


;; 1.13. The following function returns the same result no matter what its input.
;;       What result does it return?

(defun xx (n)
  (symbolp (numberp n)))

;; It always return 'T because the result of 'numberp is always a symbol


;;; 1.10 The not predicate

(not t)
(not nil)
(not 'fred)


;;; Exercise

;; 1.14. Fill in the results of the following computations:
(not nil)  ;; 'T
(not 12)   ;; nil
(not 'not) ;; nil


;;; 1.11 NEGATING A PREDICATE

(defun not-equal (x y)
  (not (equal x y)))

(not-equal 'pink 'green)
(not-equal 'pink 'pink)


;;; Exercises

;; 1.15. Write a predicate NOT-ONEP that returns T if its input is anything
;;       other than one.

(defun not-onep (n)
  (not (equal 1 n)))

(not-onep 1)
(not-onep 2)
(not-onep 0)


;; 1.16. Write the predicate NOT-PLUSP that returns T if its input is not greater
;;       than zero.

(defun not-plusp (n)
  (not (> n 0)))

(not-plusp -4)  ;;'T
(not-plusp 0)   ;;'T
(not-plusp 3)   ;;'NIL


;; 1.17. Some earlier Lisp dialects did not have the EVENP primitive; they only
;;       had ODDP. Show how to define EVENP in terms of ODDP

(defun evenp-1 (n)
  (not (oddp n)))

(evenp-1 4)
(evenp-1 3)


;; 1.18. Under what condition does this predicate function return T?

(defun negative-two-p (n)
  (zerop (add1 (add1 n))))

;; When N is negative 2

(negative-two-p -2)
(negative-two-p -1)
(negative-two-p 2)


;; 1.19. What result does the function below produce when given the input
;;       NIL? What about the input T? Will all data flow through this function
;;       unchanged? What result is produced for the input RUTABAGA?

(defun not-not-p (x)
  (not (not x)))

(not-not-p nil)  ; nil
(not-not-p t)    ; t
(not-not-p 3)    ; t

;; it passes only'NIL and 'T through, it changes everything else to 'T


;;; 1.12 Number of Inputs to a Function

;; variable number
(* 2 3 5)
(- 50 3 4)
(/ 120 2 5)

(- 4)
(/ 4.0)


;;; 1.13 Errors

;;(+ 3 'fred)
;;(equal 2)
;;(oddp 4 7)
;;(/ 3 0)


;;; Exercises

;; 1.21. What is wrong with each of these functions?

(defun add-to-symbol (n)
  (add1 (zerop n)))

;;(add-to-symbol 3)
;; Cant ADD1 to a truth symbol

;; (defun equal-of-one-number (n m)
;;   (equal (+ n m)))
;; Can pass only one number to 'EQUALP

;; (defun not-on-two-inputs (n m)
;;   (symbolp (not n m)))


;;; Review Exercises

;; 1.22. Are all predicates functions? Are all functions predicates?
;; Yes - No

;; 1.23. Which built-in predicates introduced in this chapter have names that do
;;       not end in ‘‘P’’?
;; > < not equal

;; 1.24. Is NUMBER a number? Is SYMBOL a symbol?
;;  Both are symbols

;; 1.25. Why is FALSE true in Lisp?
;; FALSE is not 'NIL so it's 'T

;; 1.26. True or false: (a) All predicates accept T or NIL as input; (b) all
;;        predicates produce T or NIL as output.
;; (a) False  (b) True

;; 1.27. Give an example of the use of EVENP that would cause a wrong-type
;;       input error. Give an example that would cause a wrong-number-of
;;       inputs error.

;;(evenp  'one)
;;(evenp 2 3)
