(defun sum(x y)
(if (>= (length x) 1)
  (cond 
	((numberp (car x)) (append (list (+ (car x) y)) (sum (cdr x) y)))
	((listp (car x)) (cons (sum (car x) y) (sum (cdr x) y)))
	(t (append (list(car x)) (sum (cdr x) y)))) 
  nil))

(defun howmany(lst a)
(if lst
  (if (listp (car lst)) (+ (if (equal (car lst) a) 1 0) (howmany (cdr lst) a))
	(+ (if (equal (car lst) a) 1 0) (howmany (cdr lst) a))) 0)
)

(defun removes(k lst)
(cond
  ((NULL lst) nil)
  ((eql k (car lst)) (removes k (cdr lst) ))
  (t (cons (car lst) (removes k (cdr lst) )))
   ))

(defun solve(lst)
  (cond ((NULL lst) nil )
  (t (cons (list (car lst) (howmany lst (car lst))) (solve (removes (car lst) lst)))))	
)

(print (solve '((1) 1 1 1 2 2 2)))
