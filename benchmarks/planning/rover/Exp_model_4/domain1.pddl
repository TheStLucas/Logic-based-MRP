(define (domain logistics)
  (:requirements :strips)
  (:predicates  (package ?obj)
          (truck ?truck)
    (airplane ?airplane)
                (airport ?airport)
                (location ?loc)
    (in-city ?obj ?city)
                (city ?city)
    (at ?obj ?loc)
    (in ?obj ?obj))


(:action load-truck
  :parameters
   (?obj
    ?truck
    ?loc)
  :precondition
   (and (package ?obj)(location ?loc)
    (at ?obj ?loc))
  :effect
   (and ))

(:action load-airplane
  :parameters
   (?obj
    ?airplane
    ?loc)
  :precondition
   (and (package ?obj) )
  :effect
   (and  (in ?obj ?airplane)))

(:action unload-truck
  :parameters
   (?obj
    ?truck
    ?loc)
  :precondition
   (and (truck ?truck) (location ?loc)
        )
  :effect
   (and (not (in ?obj ?truck)) ))

(:action unload-airplane
  :parameters
   (?obj
    ?airplane
    ?loc)
  :precondition
   (and (at ?airplane ?loc))
  :effect
   (and (at ?obj ?loc)))

(:action drive-truck
  :parameters
   (?truck
    ?loc-from
    ?loc-to
    ?city)
  :precondition
   (and (truck ?truck) (city ?city))
  :effect
   (and (not (at ?truck ?loc-from)) ))

(:action fly-airplane
  :parameters
   (?airplane
    ?loc-from
    ?loc-to)
  :precondition
   (and 
  (at ?airplane ?loc-from))
  :effect
   (and ))
)
