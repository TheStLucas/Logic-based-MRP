(define (domain Rover)
(:requirements :typing)
(:types rover waypoint store camera mode lander objective)

(:predicates (at ?x - rover ?y - waypoint)
             (atlander ?x - lander ?y - waypoint)
             (cantraverse ?r - rover ?x - waypoint ?y - waypoint)
	     (equippedforsoilanalysis ?r - rover)
             (equippedforrockanalysis ?r - rover)
             (equippedforimaging ?r - rover)
             (empty ?s - store)
             (haverockanalysis ?r - rover ?w - waypoint)
             (havesoilanalysis ?r - rover ?w - waypoint)
             (full ?s - store)
	     (calibrated ?c - camera ?r - rover)
	     (supports ?c - camera ?m - mode)
             (available ?r - rover)
             (visible ?w - waypoint ?p - waypoint)
             (haveimage ?r - rover ?o - objective ?m - mode)
             (communicatedsoildata ?w - waypoint)
             (communicatedrockdata ?w - waypoint)
             (communicatedimagedata ?o - objective ?m - mode)
	     (atsoilsample ?w - waypoint)
	     (atrocksample ?w - waypoint)
             (visiblefrom ?o - objective ?w - waypoint)
	     (storeof ?s - store ?r - rover)
	     (calibrationtarget ?i - camera ?o - objective)
	     (onboard ?i - camera ?r - rover)
	     (channelfree ?l - lander)

)


(:action navigate
:parameters (?x - rover ?y - waypoint ?z - waypoint)
:precondition (and (cantraverse ?x ?y ?z) (available ?x) (at ?x ?y))
:effect (and (not (at ?x ?y)) (at ?x ?z)
		)
)

(:action samplesoil
:parameters (?x - rover ?s - store ?p - waypoint)
:precondition (and (atsoilsample ?p) (equippedforsoilanalysis ?x) (storeof ?s ?x) (empty ?s)
		)
:effect (and (not (empty ?s)) (full ?s) (havesoilanalysis ?x ?p) (not (atsoilsample ?p))
		)
)

(:action samplerock
:parameters (?x - rover ?s - store ?p - waypoint)
:precondition (and (at ?x ?p)  (equippedforrockanalysis ?x) (storeof ?s ?x)(empty ?s)
		)
:effect (and (not (empty ?s)) (full ?s) (haverockanalysis ?x ?p) (not (atrocksample ?p))
		)
)

(:action drop
:parameters (?x - rover ?y - store)
:precondition (and (storeof ?y ?x) 
		)
:effect (and (not (full ?y)) (empty ?y)
	)
)

(:action calibrate
 :parameters (?r - rover ?i - camera ?t - objective ?w - waypoint)
 :precondition (and (equippedforimaging ?r)  (at ?r ?w) (visiblefrom ?t ?w)(onboard ?i ?r)
		)
 :effect (calibrated ?i ?r)
)




(:action takeimage
 :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
 :precondition (and (calibrated ?i ?r)
			 (onboard ?i ?r)
                      (equippedforimaging ?r)
                      
			  (visiblefrom ?o ?p)
                     (at ?r ?p)
               )
 :effect (and (haveimage ?r ?o ?m)(not (calibrated ?i ?r))
		)
)


(:action communicatesoildata
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(atlander ?l ?y)(havesoilanalysis ?r ?p)
                   (visible ?x ?y)(channelfree ?l)
            )
 :effect (and (not (available ?r))(not (channelfree ?l))(channelfree ?l)
		(communicatedsoildata ?p)(available ?r)
	)
)

(:action communicaterockdata
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(haverockanalysis ?r ?p)
                   (visible ?x ?y)(available ?r)(channelfree ?l)
            )
 :effect (and (not (available ?r))(not (channelfree ?l))(channelfree ?l)(communicatedrockdata ?p)(available ?r)
          )
)


(:action communicateimagedata
 :parameters (?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(atlander ?l ?y)(visible ?x ?y)(available ?r)(channelfree ?l)
            )
 :effect (and (not (available ?r))(not (channelfree ?l))(channelfree ?l)(communicatedimagedata ?o ?m)(available ?r)
          )
)

)