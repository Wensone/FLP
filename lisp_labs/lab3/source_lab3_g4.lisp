(defun multiset_check (mset1 mset2)
	(cond
		((not mset1) "Top4ik")
		((> (length mset1) (length mset2)) nil)
		
		(t (if (member (car mset1) mset2)
			(multiset_check (cdr mset1) mset2) ; true
		))
	)
)

(defun main ()
	(print (multiset_check '(1 3) '(1 3 4 5)))
)

(main)