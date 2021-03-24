
module AG = AcyclicGraph
exception Inconsistency of AG.constraint_type * int * int *
                           (AG.constraint_type * int) list Lazy.t option

module ISet : Set.S with type elt = int
module IMap : Map.S with type key = int

module Constraint : Set.S with type elt = (int * AG.constraint_type * int)

type t

val empty : t

val check_invariants : required_canonical:(int -> bool) -> t -> unit

exception AlreadyDeclared
val add : ?rank:int -> int -> t -> t

exception Undeclared of int
val check_declared : t -> ISet.t -> unit

type 'a check_function = t -> 'a -> 'a -> bool

val check_eq : int check_function
val check_leq : int check_function
val check_lt : int check_function

val enforce_eq : int -> int -> t -> t
val enforce_leq : int -> int -> t -> t
val enforce_lt : int -> int -> t -> t

val constraints_for : kept:ISet.t -> t -> Constraint.t

val domain : t -> ISet.t

val choose : (int -> bool) -> t -> int -> int option

type node = Alias of int | Node of bool IMap.t
type repr = node IMap.t
val repr : t -> repr
