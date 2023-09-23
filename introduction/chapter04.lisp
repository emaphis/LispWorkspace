;;; COMMON LISP: A Gentle Introduction to Symbolic Computation
;;; Chapter 4 -  Conditionals


;;; Section 4.2 -  The IF Special Form

(if (oddp 1) 'odd 'even)  ; ODD

(if (oddp 2) 'odd 'even)  ; EVEN

(if t 'test-was-true 'test-was-false)  ; TEST-WAS-TRUE

(if nil 'test-was-true 'test-was-false)  ; TEST-WAS-FALSE

(if (symbolp 'foo )  (* 5 5 ) (+ 5 5)) ;25

(if (symbolp 5)  (* 5 5 ) (+ 5 5))   ; 10

(defun my-abs (x)
  "Return the absolute value of X"
  (if (< x 0) (- x) x))

(my-abs -5) ; 5
(my-abs 5)  ; 5

;; Another simple decision makeing function
(defun symbol-test (x)
  (if (symbolp x) (list 'yes x 'is 'a 'symbol)
    (list 'no x 'is 'not 'a 'symbol)))

(symbol-test 'rutabaga) ; (YES RUTABAGA IS A SYMBOL)
(symbol-test 12345) ; (NO 12345 IS NOT A SYMBOL)

;; Two inputs instead of three
(if t 'happy)   ; HAPPY
(if nil 'happy) ; NIL


;;; Exercises

;; Ex 4.1
;; Write a function MAKE-EVEN that makes an odd number even by
;; adding one to it. If the input to MAKE-EVEN is already even, it should
;; be returned unchanged.

(defun make-even (n)
  (if (oddp n) (+ 1 n) n))

(make-even 3)  ; 4
(make-even 4)  ; 4


;; Ex 4.2
;; Write a function FURTHER that makes a positive number larger by
;; adding one to it, and a negative number smaller by subtracting one
;; from it. What does your function do if given the number 0?

(defun further (n)
  (if (> n -1)
    (+ n 1)
    (- n 1)))

(further -5)  ; -6
(further 5)   ; 6
(further 0)   ; 1


;; Ex 4.3
;; Recall the primitive function NOT: It returns NIL for a true input and T
;; for a false one. Suppose Lisp didnt have a NOT primitive. Show how
;; to write NOT using just IF and constants (no other functions). Call your
;; function MY-NOT.

(defun my-not (x)
  (if x nil t))

(my-not t)    ; NIL
(my-not nil)  ; T
(my-not 'a)   ; NIL


;; Ex 4.4
;; Write a function ORDERED that takes two numbers as input and makes
;; a list of them in ascending order. (ORDERED 3 4) should return the
;; list (3 4). (ORDERED 4 3) should also return (3 4), in other words, the
;; first and second inputs should appear in reverse order when the first is
;; greater than the second.

(defun ordered (x y)
  (if (< x y)
      (list x y)
    (list y x)))

(ordered 1 2)  ; (1 2)
(ordered 2 1)  ; (1 2)


;;; Section 4.3 -  The COND Macro

(defun compare (x y)
  (cond ((equal x y) 'numbers-are-the-same)
        ((< x y) 'first-is-smaller)
        ((> x y) 'first-is-bigger)))

(compare 3 5)  ; FIRST-IS-SMALLER
(compare 7 2)  ; FIRST-IS-BIGGER
(compare 4 4)  ; NUMBERS-ARE-THE-SAME


;;; Exercise

;; Ex. 4.5
;; For each of the following calls to COMPARE, write “1,” “2,” or “3” to
;; indicate which clause of the COND will have a predicate that evaluates
;; to true

(compare 9 1)        ; "3"
(compare (+ 2 2) 5)  ; "2"
(compare 6 (* 2 3))  ; "1"


;;; Section 4.4 -  Using T as a Test

(defun where-is (x)
  (cond ((equal x 'paris) 'france)
        ((equal x 'london) 'england)
        ((equal x 'beijing) 'china)
        (t 'unknown)))

(where-is 'london)   ; ENGLAND
(where-is 'beijing)  ; CHINA
(where-is 'hackernsack) ; UNKNOWN





;;;;; End
