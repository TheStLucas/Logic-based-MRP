(define (domain BLOCKS)
  (:requirements :strips :typing)
  (:types block)
  (:predicates (on ?x - block ?y - block)
	       (ontable ?x - block)
	       (clear ?x - block)
	       (handempty)
	       (holding ?x - block)
	       )

  (:action pick-up
	     :parameters (?x - block)
	     :precondition (and (ontable ?x) )
	     :effect
	     (and
		   (not (handempty))
		   ))

  (:action put-down
	     :parameters (?x - block)
	     :precondition (and (holding ?x))
	     :effect
	     (and
		   (ontable ?x)))

  (:action stack
	     :parameters (?x - block ?y - block)
	     :precondition (and  (clear ?y))
	     :effect
	     (and
		   (handempty)
		  ))

  (:action unstack
	     :parameters (?x - block ?y - block)
	     :precondition (and  (handempty))
	     :effect
	     (and (holding ?x)
		  )))