;; logistics domain
;;

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
   (and )
  :effect
   (and (not (at ?obj ?loc)) (in ?obj ?truck)))

(:action load-airplane
  :parameters
   (?obj
    ?airplane
    ?loc)
  :precondition
   (and )
  :effect
   (and (not (at ?obj ?loc)) (in ?obj ?airplane)))

(:action unload-truck
  :parameters
   (?obj
    ?truck
    ?loc)
  :precondition
   (and )
  :effect
   (and (not (in ?obj ?truck)) (at ?obj ?loc)))

(:action unload-airplane
  :parameters
   (?obj
    ?airplane
    ?loc)
  :precondition
   (and )
  :effect
   (and (not (in ?obj ?airplane)) (at ?obj ?loc)))

(:action drive-truck
  :parameters
   (?truck
    ?loc-from
    ?loc-to
    ?city)
  :precondition
   (and )
  :effect
   (and (not (at ?truck ?loc-from)) (at ?truck ?loc-to)))

(:action fly-airplane
  :parameters
   (?airplane
    ?loc-from
    ?loc-to)
  :precondition
   (and )
  :effect
   (and (not (at ?airplane ?loc-from)) (at ?airplane ?loc-to)))
)
