;;; COMMON LISP: A Gentle Introduction to Symbolic Computation
;;; Chapter 3 -  EVAL Notation


;;; Section 3.2 - The EVAL Function

;; (+ 2 3) EVALs to 5

(+ 2 3)  ; 5

(+ 1 6)  ; 7

(oddp (+ 6 1)) ; 'T

(* 3 (+ 1 6))  ; 21

(/ (* 2 11) (+ 1 6))  ; 22/7


;;; Section 3.3  -  EVAL Notation can do anything Box

;;; Section 3.4 - Evaluation Rules Define the Behavior of EVAL

;;; 1. Evaluation rule for Numbers, T ad NIL: "Numbers, and the symbols
;;;    T and NIL, evaluate to themselves".

;;; 2. Evaluation Rule for Lists: The first element of the list specifies a
;;;    function to be called. The remaining elements specify arguments to
;;;    the function. The function is called on the evaluated arguments.



;;; Exercises

;; 3.1
;; What does (NOT (EQUAL 3 (ABS -3))) evaluate to?

(not (equal 3 (abs -3)))  ; NIL
(not (equal 3 3))
(not t)
nil


;; 3.2
;; Write an expression in EVAL notation to add 8 to 12 and divide the
;; result by 2.
(/ (+ 8 12) 2) ; 10


;; 3.3
;; You can square a number by multiplying it by itself. Write an
;; expression in EVAL notation to add the square of 3 and the square of 4.

(+ (* 3 3)
   (* 4 4))  ; 25


;; 3.4
;; Draw an evaltrace diagram for each of the following expressions.

(- 8 2)
6

(not (oddp 4))
(not nil)
'T

(> (* 2 5) 9)
(> 10 9)
'T

(not (equal 5 (+ 1 4)))  ; NIL
(not (equal 5 5))
(not t)


;;; Section 3.5  - Defining Functions in EVAL Notation

;; The AVERAGE function is defined in EVAL notation this way:
(defun average (x y)
  (/ (+ x y) 2.0))

(average 6 8) ; 7.0

(defun square (n) (* n n))

(defun total-cost (quantity price handling-charge)
  (+ (* quantity price) handling-charge))



;;; Exercise

;; 3.5
;; Write definitions for HALF, CUBE, and ONEMOREP using DEFUN.
;; (The CUBE function should take a number n as input and return w^3.)

(defun half (n)
  (/ n 2))

(half 8)  ; 4

(defun cube (n)
  (* n n n))

(cube 3) ; 27

(defun onemorep (x y)
  (equal x (+ y 1)))

(onemorep 2 1)  ; T
(onemorep 1 2)  ; NIL
(onemorep 2 2)  ; NIL


;; 3.6
;; Define a function PYTHAG that takes two inputs, x and y, and returns
;; the square root of x^2+y^2. You may recognize this as Pythagoras’s
;; formula for computing the length of the hypotenuse of a right triangle
;; given the lengths of the other two sides. (PYTHAG 3 4) should return
;; 5.0.1q

(defun pythag (x y)
  (sqrt (+ (* x x)
           (* y y))))

(pythag 3.0 4.0)  ; 5.0


;; 3.7
;; Define a function MILES-PER-GALLON that takes three inputs, called
;; INITIAL-ODOMETER-READING, FINAL-ODOMETER-READING, and GALLONS-CONSUMED,
;; and computes the number of miles traveled per gallon of gas.

(defun miles-per-gallon (intital-odometer-readong
                         final-odometer-reading
                         gallons-consumed)
  (/ (- final-odometer-reading intital-odometer-readong)
     gallons-consumed))

(miles-per-gallon 1000 1030 3)  ; 10


;; 3.8
;; How would you define SQUARE in box notation?


;;; Section 3.6 -  Variables


;;; Section 3.7 -  Evaluating Symbols

;;; Evaluation Rule for Symbols: A symbol evaluates to the value of the
;;; variable it refers to

pi  ; 3.141592653589793d0

;; eggplant
;; The variable EGGPLANT is unbound.


;;; Section 3.8 -  Using Symbols and Lists as Data

 ;; (equal kirk spock)
;;The variable KIRK is unbound.

(equal 'kirk 'spock)  ; NIL

;; T and NIL evaluate to themselves
(list 'james t 'kirk)  ; (JAMES T KIRK)

;; Symbols must be quoted to prevent evaluation if the represent data

(defun riddle (x y)
  (list 'why 'is 'a x 'like 'a y))

(riddle 'raven 'writing-desk) ; (WHY IS A RAVEN LIKE A WRITING-DESK)

;; (first (we hold these truths))
;; The variable HOLD is unbound.

(first '(we hold these truths))  ; WE

;;(third (my aunt mary))

(third '(my aunt mary))

(+ 1 2)  ; 3

'(+ 1 2)  ; (+ 1 2)

(oddp (+ 1 2))  ; T
;;(oddp '(+ 1 2))  ; Error


;;; Section 3.9 -  The Problem of Misquoting

;; (list 'a 'b c)  ;Error
(list 'a 'b 'c)

;; (cons 'a (b c)) ; Error
(cons 'a '(b c))


;;; Section 3.10 -  Three Ways to Make Lists

'(foo bar baz)

(list 'foo 'bar 'baz)

(cons 'foo '(bar baz))


(list 33 'squared 'is (* 33 33)) ; (33 SQUARED IS 1089)


;; Several ways to make an error

;; (list foo bar baz)
;; The variable FOO is unbound.

;;(foo bar baz)
;; The variable BAR is unbound.

;; ('foo 'bar 'baz)
;; Compiles with errors


;;; Exercises

;; 3.9
;; The following expressions evaluate without any errors. Write down the
;; results.

(cons 5 (list 6 7))  ; (5 6 7)

(cons 5 '(list 6 7)) ; (5 LIST 6 7)

(list 3 'from 9 'gives (- 9 3))  ; (3 FROM 9 GIVES 6)

(+ (length '(1 foo 2 moo))
   (third '(1 foo 2 moo)))  ; 6

(rest '( cons is short for constant))
;; (IS SHORT FOR CONSTANT)


;; 3.10
;; The following expressions all result in errors. Write down the type of; error
;; that occurs, explain how the error arose
;; (for example, missing  quote, quote in wrong place), and correct the
;; expression by changing only the quotes.

;;(third (the quick brown fox))  ; Missing quote
(third '(the quick brown fox))   ; BROWN

;;(list 2 and 2 is 4)   ; Missing quote AND
(list 2 'and 2 'is 4)   ; (2 AND 2 IS 4)

;;(+ 1 ’(length (list t t t t)))  ; Remove quot from the function call
(+ 1 (length (list t t t t)))     ; 5

;;(cons 'patrick (seymour marvin))  ; Missing quote on the list
(cons 'patrick '(seymour marvin))   ; (PATRICK SEYMOUR MARVIN)

;;(cons 'patrick (list seymour marvin))  ; SEYMOUR and MARVIN should be quoted
(cons 'patrick (list 'seymour 'marvin))  ; (PATRICK SEYMOUR MARVIN)


;; 3.11
;; Define a predicate called LONGER-THAN that takes two lists as input
;;  and returns T if the first list is longer than the second.

(defun longer-than (lsta lstb)
  (> (length lsta) (length lstb)))

(longer-than '(x x x) '(x x))  ; T
(longer-than '(x x) '(x x x))  ; NIL


;; 3.12
;; Write a function ADDLENGTH that takes a list as input and returns a
;; new list with the length of the input added onto the front of it. If the
;; input is (MOO GOO GAI PAN), the output should be (4 MOO GOOGAI PAN).
;; What is the result of (ADDLENGTH (ADDLENGTH ’(A B C)))?

(defun addlength (lst)
  (cons (length lst) lst))

(addlength '(moo goo gai pan))    ; (4 MOO GOO GAI PAN)
(addlength (addlength '(a b c)))  ; (4 3 A B C)


;; 3.13
;; How many arguments does this function require? What are the names
;; of the arguments? What is the result of (CALL-UP ’FRED ’WANDA)?

(defun call-up (caller callee)
  (list 'hello callee 'this 'is
        caller 'calling))

;; Requires two arguments
;; The names of the arguments are CALLER CALLEE

;; should be:  (HELLO WANDA THIS IS FRED CALLING)
(call-up 'fred 'wanda)


;; 3.14
;; Here is a variation on the CALL-UP function from the previous
;; problem. What is the result of (CRANK-CALL ’WANDA ’FRED)?

(defun crank-call (caller callee)
  '(hello callee this is caller calling))

;; should be: (HELLO CALLEE THIS IS CALLER CALLING)
(crank-call 'wanda 'fred)


;; Section 3.11 -  Four Ways to Mis-define a Function

 (defun intro (x y) (list x 'this 'is y))

(intro 'stanly 'livingston)

;; Bad arguments
;;(defun intro ('x 'y) (list x 'this 'is y))

;; Bad arguments
;;(defun intro ((x) (y)) (list x 'this 'is y))


;; Section 3.12  -  More about Variables

;; Creates an 'N variable every time we call ig
(defun double-1 (n) ( * n 2))

;; n
;The variable N is unbound.

;; Two variables
(defun quadruple (n) (double-1 (double-1 n)))


;;; Exercises

;; 3.15
;; Consider the following function, paying close attention to the quotes:
;; The symbol WORD is used two different ways in this function. What
;; are they? What is the result of (SCRABBLE ‘AARDVARK)? What is
;; the result of (SCRABBLE ‘WORD)?

(defun scrabble (word)
  (list word 'is 'a 'word))

;; WORD is used as a variable and as a symbol.
(scrabble 'aardvark)  ; (AARDVARK IS A WORD)
(scrabble 'word)       ; (WORD IS A WORD)


;; 3.16
;; Here’s a real confuser:

(defun stooge (larry moe curly)
  (list larry (list 'moe curly) curly 'larry))

(stooge 'moe 'curly 'larry)
;; (moe (moe larry) larry larry)


;; 3.17
;; Why can’t the special symbols T or NIL be used as variables in a func‐
;; tion definition? (Consider the evaluation rule for T and NIL versus the
;; rule for evaluating ordinary symbols.)

;; 'T and 'NIL always evaluate to themselves.


;;; Review Exercises

;; 3.18
;; Name two advantages of EVAL notation over box notation.

;; More concise, can represent more complex things than box notation, easier to
;; represent in an editor buffer


;; 3.19
;; Evaluate each of the following lists. If the list causes an error, tell what
;; the error is. Otherwise, write the result of the evaluation. 

(cons 'grapes '(of wrath))  ; Fine:  (GRAPES OF WRATH)

(list t 'is 'not nil)       ; Fine:   (T IS NOT NIL)

(first '(list moose goose))  ; Fine:  List

(first (list 'moose 'goose))  ; Fine:  MOOSE

;;(cons 'home ('sweet 'home)) ; Missing a quote on the list


;; 3.20
;; Here is a mystery function:

(defun mystery (x)
  (list (second x) (first x)))

;; What result or error is produced by evaluating each of the following?

;; - Must take list as a parameter

(mystery '(dancing bear))  ; (BEAR DANCING)

;;(mystery 'dancing 'bear)  ; must be a list.

(mystery '(zowie))     ; (NIL ZOWIE)

(mystery (list 'first 'second))  ; (SECOND FIRST)

(mystery nil)  ; (NIL NIL)

(mystery '( a b c))  ; (A B)


;; 3.21
;; What is wrong with each of the following function definitions?

;;(defun speak1 (x y) (list 'all 'x 'is 'y))
;; Dose not use its parameters

;;(defun speak2 (x) (y) (list 'all x 'is y))
;; (y) is an undefined function call

;;(defun speak3 ((x) (y)) (list all 'x is 'y))
;; Misconstructed parameter list, all an is are undefined


;;; Section 3.13 -  Running Lisp

;; Starting SBCL

;; C:\src\lisp>sbcl
;; This is SBCL 2.3.8, an implementation of ANSI Common Lisp.
;; More information about SBCL is available at <http://www.sbcl.org/>.

;; SBCL is free software, provided as is, with absolutely no warranty.
;; It is mostly in the public domain; some portions are provided under
;; BSD-style licenses.  See the CREDITS and COPYING files in the
;; distribution for more information.
;; *

;; * is the repl prompt

;; SBCL is mostly designed to be used from an IDE

;; Use (exit) or (quit) to quit


;;; Section 3.14 -  The READ-EVAL-PRINT LOOP

;; * (defun square (n) (* n n))
;; SQUARE
;; * (square 4)
;; 16
;; * (square 5)
;; 25
;; * (square 123456789)
;; 15241578750190521

;; A better REPL
;; * (require 'sb-aclrepl)


;; Section 3.15 -  Recovering from Errors

;; The Sly REPL in Emacs has nice editing functions so you don't really
;; need to escape input

;; Typing q gets out of the debugger


;;; Exercises

;; 3.22
;; a.
;; Find out how to run Lisp on your computer, and start it up.
;; See above.
; > sbcl

;; b.
;;  For each following expression, write down what you think it evaluates
;;  to or what kind of error it will cause. Then try it on the computer
;;  and see.

(+ 3 5)  ; 8
;;(3 + 5) ; Bad form
;;(+ 3 (5 6)) ; Bad form
(+ 3 (* 5 6)) ; 33
'(morning noon night)
;;('morning 'noon 'night)  ; Bad From
(list 'morning 'noon 'night)
(car nil)
;;(+ 3 foo)  ; Bad form
;;(+ 3 'foo) ; Still Bad form

;; c.
;; Here is an example of the function MYFUN, a strange function of
;; two inputs
;; (myfun 'alpha 'beta)  ; ((ALPHA) BETA)

(defun myfun (a b)
   (list (list a) b))

(myfun 'alpha 'beta)

;; d.
;; Write a predicate FIRSTP that returns T if its first argument (a symbol)
;; is equal to the first element of its second argument (a list).
;; That is, (FIRSTP ‘FOO ‘(FOO BAR BAZ)) should return T.
;; (FIRSTP ‘BOING ‘(FOO BAR BAZ)) should return NIL.

(defun firstp (s lst)
  (equal s (car lst)))

(firstp 'foo '(foo bar baz))    ; T
(firstp 'boing '(foo bar baz))  ; NIL

;; e.
;; Write a function MID-ADD1 that adds 1 to the middle element of a
;; three-element list. For example, MID-ADD 1 ‘(TAKE 2 COOKIES))
;; should return the list (TAKE 3 COOKIES). Note: You are
;; not allowed to make MID-ADD 1 a function of three inputs. It has
;; to take a single input that is a list of three elements.

(defun mid-add1 (lst)
  (list (car lst)
        (+ 1 (cadr lst))
        (caddr lst)))

(mid-add1 '(take 2 cookies))
;; (TAKE 3 COOKIES)

;; f.
;; Write a function F-TO-C that converts a temperature from Fahren‐
;; heit to Celsius. The formula for doing the conversion is: Celsius
;; temperature = [5 x (Fahrenheit temperature - 32)]/9. To go in the
;; opposite direction, the formula is: Fahrenheit temperature = (9/5 x
;; Celsius temperature) + 32.

(defun f-to-c (f)
  (* 5/9 (- f 32.0)))

;; g. What is wrong with this function? What does (FOO 5) do?
;; Tries to add 1 to nil
;(defun foo (x) (+ 1 (zerop x)))


;;; 3 Advanced Topics

;;; Section 3.16 -  Functions of no arguments

(defun test () (* 85 97))

(test)  ;8245


;;; Section 3.17 -  The QUOTE Special Function

(quote foo)  ; FOO
;; equivalent to
'foo   ; FOO




(quote (hello world))

(cons 'up '(down sideways))
;; old lisp style
(cons (quote up) (quote (down sideways)))

;; multiple levels
'foo  ; FOO
''foo  ; 'FOO
(list 'quote 'foo)  ; 'FOO
(first ''foo)   ; QUOTE
(rest ''foo)    ; (FOO)
(length ''foo)  ; 2


;;; Section 3.18 -  Structure of Symbols

(symbol-name 'equal)  ; "EQUAL"
(symbol-function 'equal)  ; #<FUNCTION EQUAL>


;;; Section 3.19 -  Lambda Notation

(lambda (x) (+ 3 x))
((lambda (x) (+ 3 x)) 4)  ; 7

(lambda (x y) (+ (* 3 x) (* y y)))

(symbol-function 'half)


;;; Exercise

;; 3.23
;; Write each of the following functions in Church’s lambda notation:
;; DOUBLE, SQUARE, ONEMOREP


;;; Section 3.20 -  Scope of Variables


;;; Exercise

;; 3.24 Assume we have defined the following functions:

(defun alpha (x)
  (bravo (+ x 2) (charlie x 1)))

(defun bravo (y z) (* y z))

(defun charlie (y x) (- y x))

;; Suppose we now evaluate (ALPHA 3). Show the resulting creation
;; and use of variables X, Y, and Z by drawing an evaltrace diagram.

(alpha 3)  ; 10
(bravo (+ 3 2) (charlie 3 1))  ; Substitute 3 for x
(bravo 5 (charlie 3 1))  ; Evaluate '(+ 3 2)
(bravo 5 (- 3 1))   ; Substitute substitute definition of charlie
(bravo 5 2)
(* 5 2)


;;; Section 3.21 -  EVAL and APPLY

'(+ 2 2)  ; (+ 2 2)
(eval '(+ 2 2))  ; 4
'''boing        ; ''BOING
(eval '''boing) ; 'BOING
(eval (eval '''boing)) ; BOING
;; (eval (eval (eval '''boing)))  ; ERROR

(apply #'+ '(2 3))  ; 5
(apply #'equal '(12 17))

(apply #'cons '(as (you like it)))
;; (AS YOU LIKE IT)

;; EVAL and APPLY can be defined in terms of each other


;;; Exercise

;; 3.25 What do each of the following expressions evaluate to?

(list 'cons t nil)         ; (CONS T NIL)

(eval (list 'cons t nil))  ; (T)

;;(eval (eval (list 'cons t nil)))  ; ERROR

(apply #'cons '(t nil))  ; (T)

(eval nil)  ; NIL

(list 'eval nil)  ; (EVAL NIL)

(eval (list 'eval nil))  ; NIL
