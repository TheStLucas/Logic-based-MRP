(define (problem BLOCKS-4-2)
(:domain BLOCKS)
(:objects B C A - block)
(:INIT (CLEAR C)  (ONTABLE A)
 (ON C B) (ON B A) (HANDEMPTY))
(:goal (AND (ON A B) (ON B C)))
)