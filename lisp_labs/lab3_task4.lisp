(defun multiset_check (mset1 mset2)
	(cond
		((not mset1) "Top4ik")
		((> (length mset1) (length mset2)) nil)
		
		(t (if (member (car mset1) mset2)
			(multiset_check (cdr mset1) mset2) ; true
		))
	)
)

(defun sim (a b)
(cond 
  ((not (and a b)) (append a b))
   ((member (car a) b) (sim (remove (car a) a) (remove (car a) b))) 
	(t (cons (car a) (sim (cdr a) b)))
))

(defun test (x y)
  (list (remove (car x) y) (remove (car x) x) ))

(defun main ()
	(print (sim '() '(* 1 b 2 3 5)))
	(print (multiset_check '(1 3) '(1 3 4 5)))
)

(main)
