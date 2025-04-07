;;; COMMON LISP: A Gentle Introduction to Symbolic Computation
;;; Chapter 2 - Lists


;;;*********************************************
;;; Section 2.2 - What Do Lists Look Like.

'(red green blue)
'(aardvark)
'(1 3 5 7 11 13 17)
'(3 french hens 2 turtle doves 1 partrige 1 pear tree)

;; *|*---->*|*---->*|*--->NIL
;; |       |       |
;; V       V       V
;; RED     GREEN   BLUE


;;; Exercise

;; 2.1. Show how the list (TO BE OR NOT TO BE) would be represented in
;;      computer memory by drawing its cons cell representation.

;; *|*-->*|*-->*|*->*|--->*|*->*|*-->NIL
;; |     |     |    |     |    |
;; V     V     V    V     V    V
;; TO    BE    OR   NOT   TO   BE


;;;*******************************************
;;; Section - 2.3 Lists of one element

'(aardvark)

;;  *|*---->NIL
;;  |
::  V
;;  AARDVARK


;;; Section 2.4 -  Nested lists

'((blue sky) (grean grass) (brown earth))

'((blue sky)
  (green grass)
  (brown earth))

'((brain surgeons) never (say opps))


;;; Exercises

;; 2.2 Which of these are well-formed lists? properly balanced parentheses?
;;     That is, which ones have properly balanced parentheses?

;; '(a b (c)  ;; 'NIL

;; '(A (B (C))  ;; 'NIL

'(A (B (C)))  ;; 'T

'(((A) (B)) (C))  ;; 'T

;; 2.3 Draw the cons cell representation of the list
;; (PLEASE (BE MY) VALENTINE)

'(PLEASE (BE MY) VALENTINE)

;; 2.4. What is the parenthesis notation for this cons cell structure?
'((BOWS ARROWS) (FLOWERS CHOCOLATES))
;; Yes


;;;**************************************
;;; Section 2.5 -  Length of Lists

(length '(a b c d))   ; 4
(length '(a (b c) d)) ; 3
;;(length 'kumquat)   ; error
(length '(kumquat))   ; 1


;;; Exercise

;; 2.5  How many elements do each of the following lists have?

'(open the pod bay doors hal)      ; 6

'((open) (the pod bay doors) hal)  ; 3

'((1 2 3) (4 5 6) (7 8 9) (10 11 12)) ; 4

'((one) for all (and (two (for me)))) ; 4

'((q spades)
  (7 hearts)
  (6 clubs)
  (2 diamonds))  ; 4

'((PENNSYLVANIA (THE KEYSTONE STATE))
  (NEW-JERSEY (THE GARDEN STATE))
  (MASSACHUSETTS (THE BAY STATE))
  (FLORIDA (THE SUNSHINE STATE))
  (NEW-YORK (THE EMPIRE STATE))
  (INDIANA (THE HOOSIER STATE)))
;;    ; 6


;;;******************************************
;;; Section 2.6   - 'NIL: The Empty List

'()
(equal '() nil)  ; 'T
(length '())  ; 0
(length nil)  ; 0


;;; Exercise

;; 2.6 Match each list on the left with a corresponding list on the right by sub‐
;;    substituting NIL for () wherever possible. Pay careful attention to levels of
;;    parenthesisation.

;; ()        NIL
;; (())      (NIL)
;; ((()))    ((NIL))
;; (()())    (NIL NIL)
;; (() (())) (NIL (NIL))


;;;***********************************************
;;; Section 2.7 -  Equality of Lists

(equal '(a (b c) d) '(a b (c d)))  ; NIL


;;; Section 2.8  - First, Second, Third and Rest

(first '(a b c d))    ; A
(second '(a b c d))   ; B
(third '(a b c d))    ; C

;; (first 'kazoo)  ; Error

(rest '(a b c d))     ; (B C D)
(rest (rest '(a b c d)))  ; (C D)

;; Definition of MY-SECOND
(defun my-second (lst)
  (first (rest lst)))

(my-second '(penguins love italian ices))  ; LOVE


;;; Exercises

;; 2.7 What goes on inside the MY-SECOND box when it is given the input
;;     (HONK IF YOU LIKE GEESE)?

(rest '(honk if you like geese))  ; '(if you like geese)
(first '(if you like geese))      ; 'IF


;; 2.8 Show how to write MY-THIRD using FIRST and two RESTs
(defun my-third (lst)
  (first (rest (rest lst))))

(my-third '(honk if you like geese))  ; 'YOU

;; 2.9 Show how to write MY-THIRD using SECOND.
(defun my-third-2 (lst)
  (second (rest lst)))

(my-third-2 '(honk if you like geese))  ; 'YOU


;;;**************************************************
;;; Section 2.9 -   Functions operate on pointers

(rest '(the big bopper))  ;; (BIG BOPPER)

;;; Section 2.10 -  Car and Cdr
;; CAR stood for Contents of Address portion of Register.
;; CDR stood for Contents of Decrement portion of Register.

(car '(the big bopper))  ; THE
(cdr '(the big bopper))  ;; (BIG BOPPER)


;; Section 2.10.1 - The CDR of a Single-Element List

(car '(aardvark))  ; AARDVARK
(cdr '(aardvark))  ; NIL
(cdr nil)          ; NIL

(car '((phone home)))  ; (PHONE HOME)
(cdr '((phone home)))  ; NIL  -- no 'rest


;;; Exercises

;; 2.10  Draw the cons cell representation of the list (((PHONE HOME))),
;;       which has three levels of parentheses. What is the CAR of this list?
;;       What is the CDR?

(car '(((phone home))))  ;; ((PHONE HOME))
(cdr '(((phone home))))  ;; NIL


;;;************************************************
;;; Section 2.10.2 -   Combinations of CAR CDR

(car (cdr '(fee fie foe fum)))  ; FIE
(cadr '(fee fie foe fum))       ; FIE
(second '(fee fie foe fum))     ; FIE


;;(cdar '(fee fie foe fum))  ; Error

(cdar '((fee fie) (foe fum)))  ; (FIE)

(caddr '(fee fie foe fum))   ; FOE


;;; Exercise

;; 2.12 What C...R name does Lisp use for the function that returns the fourth
;;      element of a list? How would you pronounce it?
(cadddr '(1 2 3 4))  ; 4

(fourth '(1 2 3 4))  ; 4


;;; Section  2.10.3  -  CAR and CDR of Nested Lists

(caar '((blue cube) (red pyramid)))   ; BLUE
(caadr '((blue cube) (red pyramid)))  ; RED
(cadadr '((blue cube) (red pyramid))) ; PYRAMID


;;; Exercises

;; 2.13 Write down tables similar to the one above to illustrate how to get to
;;      each word in the list (((FUN)) (IN THE) (SUN)).

(caaar '(((fun)) (in the) (sun)))   ; FUN
(caadr '(((fun)) (in the) (sun)))   ; IN
(cadadr '(((fun)) (in the) (sun)))  ; THE
(caaddr '(((fun)) (in the) (sun)))  ; SUN


;; 2.14 What would happen if you tried to explain the operation of the
;;      CAADR function on the list ((BLUE CUBE) (RED PYRAMID)) by
;;      reading the As and Ds from left to right instead of from right to left?

(caadr '((blue cube) (red pyramid)))  ; RED
;; But in reverse
;;(cdaar '((blue cube) (red pyramid))) ; Error


;; 2.15. Using the list ((A B) (C D) (E F)), fill in the missing parts of
;;       this table.

(car '((A B) (C D) (E F)) )

;; CAR   '(A B)
;; CDDR  '(E F)
;; CADR  '(C D)
;; CDAR  '(B)
;; CADAR 'B
;; CDDAR 'NIL
;; CAAR  'A
;; CDADDR '(F)
;; CADADdR 'F


;; 2.16  What does CAAR do when given the input (FRED NIL)?
;;(caar '(fred nil))
;; Error


;;; Section 2.10.4 -   CAR and CDR of NIL

(car nil)  ; NIL
(cdr nil)  ; NIL

(third '(ding aling))  ; NIL
;; Since CAR of NIL is NIL


;;; Exercise

;; 2.17  Fill in the results of the following computations

;; car '(post no bills)    'POST
;; cdr '(post no bills)    '(NO BILLS)
;; car '((post no) bills)  '(POST NO)
;; cdr '(bills)            'NIL
;; car 'bills              Error
;; cdr '(post (no bills))  '((NO BILLS))
;; cdr  '((post no bills)) 'NIL
;; car nil                 'NIL


;;; Section 2.11 -  CONS

(cons 'a '(b c d))
(cons 'sink '(or swim))

(defun greet (name)
  (cons 'hello name))

(greet '(professor higgens))
(greet '(there miss doolittle))


;; Section 2.11.1 -  CONS and the Empty List

(cons 'frob nil)  ; (FROB)

(cons nil nil)  ; (NIL)

(cons '(phone home) nil)  ; ((PHONE HOME))


;; Section 2.11.2 -  Building Nested Lists With CONS

(cons '(fred) '(and ginger))
(cons '(now is) '(the time))


;; Section 2.11.3 -  CONS Can Build Lists From Scratch

(cons 'baz nil)
(cons 'bar '(baz))
(cons 'foo '(bar baz))

(cons 'foo
      (cons 'bar
            (cons 'baz nil)))


;;; Exercise

;; 2.18 Write a function that takes any two inputs and makes a list of them
;;      using CONS.

(defun list-of-two (x y)
  (cons x (cons y nil)))

(list-of-two 'a 'b)  ; (A B)


;;; Section 2.12 -  Symmetry of CONS and CAR/CDR

(defvar x)

(setq x '(a b c d))

(equal x (cons (car x) (cdr x)))


;;; Section 2.13 -  LIST

(list 'foo 'bar 'baz)

(list 'foo)

(list 'foo 'bar)

(list 'sun nil)

(list '(frob))

(list 'a '(b c) 'd)

(list nil)

(defun blurt (n m)
  (list n 'is 'a m))

(blurt 'mike 'nerd)

;; differences between CONS and LIST

(cons 'zort nil)

(list 'zort nil)

(cons 'able '(baker charlie))

(list  'able '(baker charlie))


;; Inside 0f list - List is cascading cons cells

(list 'cockatoo 'review)

(cons 'cockatoo (cons 'review nil))


;;; Exercise

;; 2.19 Fill in the results of the following computations

(list 'fred 'and 'wilma)
'(FRED AND WILMA)

(list 'fred '(and wilma))
'(FRED (AND WILMA))

(cons 'fred '(and wilma))
'(FRED AND WILMA)

(cons nil nil)
'(NIL)

(list nil nil)
'(NIL NIL)


;;; Section 2.14 -   Replacing the First Element of a List

(defun say-what (lst)
  (cons 'what (rest lst)))

(say-what '(take a nap))


;;; Exercises

;; 2.20 What results are returned by the following?

(list nil)
'(NIL)

(list t nil)
'(T NIL)

(cons t nil)
'(T)

(cons '(t) nil)
'((T))

 (list '(in one ear) '(out the other))
'((IN ONE EAR) (OUT THE OTHER))

 (cons  '(in one ear) '(out the other))
'((IN ONE EAR) OUT THE OTHER)


;; 2.21 Write a function that takes four inputs and returns a two-element
;;      nested list. The first element should be a list of the first two inputs, and
;;      the second element a list of the last two inputs

(defun pair-of-pairs (a b c d)
  (list (list a b) (list c d)))

(pair-of-pairs 'a 'b 'c 'd)


;; 2.22. Suppose we wanted to make a function called DUO-CONS that added
;;       two elements to the front of a list.

(defun duo-cons (a b lst)
  (cons a (cons b lst)))

(duo-cons 'a 'b nil)
(duo-cons 'a 'b '(c d))
(duo-cons 'patric 'seymour '(marvin))


;; 2.23 TWO-DEEPER is a function that surrounds its input with two levels of
;;      parentheses

(defun two-deeper (n)
  (list (list n)))

(two-deeper 'moo)
(two-deeper '(bow wow))

(defun two-deeper-2 (n)
  (cons (cons n nil) nil))

(two-deeper-2 'moo)
(two-deeper-2 '(bow wow))


;; 2.24 What built-in Lisp function would extract the symbol NIGHT from the
;;      list (((GOOD)) ((NIGHT)))?

(caaadr '(((GOOD)) ((NIGHT))))
;; CAAADR


;;; Section 2.15 -  List Predicates
;; LISTP CONSP ATOM NIL

(listp 'stitch)  ; 'NIL
(listp '(a stitch in time))  ; 't
(listp nil)  ; 'T
(consp nil)  ; 'NIL

(atom 18)
(atom 'golf)
(atom '(hole in one))


;;; Review Exercises

;; 2.25 Why do cons cells and the CONS function share the same name?
;; CONS is the constructor of a cons cell

;; 2.26 What do these two functions do when given the input (A B C)?

(defun fun-1 (lst)
  (length (cdr lst)))

;; returns two
(fun-1 '(a b c))

;; (defun fun-2 (lst)
;;   (cdr (length lst)))

;; returns an error


;; 2.27 When does the internal representation of a list involve more cons cells
;;      than the list has elements?
;; When the list is nested


;; 2.28 Using just CAR and CDR, is it possible to write a function that returns
;;      the last element of a list, no matter how long the list is? Explain
;;  No. To break down the list you need to call CDR multiple times


;;; 2. Advanced topics

;;; Section 2.16 -  Unary Arithmetic with Lists

(defun unary-sub (xs)
  (rest xs))

(unary-sub '(x x x))
(unary-sub '(x))


;;; Exercises

;; 1.29 Write a function UNARY-ADD 1 that increases a unary number by
;;      one.

(defun unary-add (xs)
  (cons 'x xs))

(unary-add '(x x x))


;; 2.30 What does the CDDR function do to unary numbers?
;; subtracts two

(defun unary-sub-two (xx)
  (cddr xx))

(unary-sub-two '(x x x x))


;; 2.31  Write a UNARY-ZEROP predicate.

(defun unary-zerop (xs)
  (null xs))

(unary-zerop '(x x x))
(unary-zerop nil)


;; 2.32 Write a UNARY-GREATERP predicate, analogous to the > predicate
;;      on ordinary numbers,

(defun unary-greaterp (xs ys)
  (> (length xs) (length ys)))

(unary-greaterp '(x x x) '(x x))  ; T
(unary-greaterp '(x x) '(x x x))  ; NIL


;; 2.33 CAR can be viewed as a predicate on unary numbers. Instead of re‐
;;      turning T or NIL, CAR returns X or NIL. Remember that X or any
;;      other non-NIL object is taken as true in Lisp. What question about a
;;      unary number does CAR answer?

(defun zerop-2 (xs)
  (car xs))

(zerop-2 '())
(zerop-2 '(x x))


;; Section 2.17  -  Non-list CONS structures

'(a b c . d)
(cons 'a 'b) ; (A . B)
(cons 'a (cons 'b 'c))  ; (A B . C)


;;; Exercises

;; 2.34 Write an expression involving cascaded calls to CONS to construct the
;;      dotted list (ABC. D)

(cons 'a (cons 'b (cons 'c 'd)))


;; 2.35 Draw the dotted list ((A . B) (C . D)) in cons cell notation. Write an
;;      expression to construct this list.

 (list (cons 'a 'b) (cons 'c 'd))


;;;****************************************
;;; Section 2.18 -  Circular Lists

;;; Exercises

;; 2.36 Prove by contradiction that this list cannot be constructed using just
;;     CONS. Hint: Think about the order in which the cells are created.

;; Since CONS can only cons on a preexisting cons cell that preexisting cell cant
;; be consed on a new cell


;; 2.19  Length of Non-List Cons Structures

;; LENGTH only returns the number of cons cells.
