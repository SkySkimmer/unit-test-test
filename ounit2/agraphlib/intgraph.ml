
module AG = AcyclicGraph

exception Inconsistency of
    AG.constraint_type * int * int * (AG.constraint_type * int) list Lazy.t option

module ISet = Set.Make(Int)
module IMap = Map.Make(Int)
module Constraint = AG.ConstraintMake(Int)

module P = struct
  type t = int
  module Set = ISet
  module Map = IMap

  module Constraint = Constraint

  let equal = Int.equal

  let compare = Int.compare

  type explanation = (AG.constraint_type * int) list

  let error_inconsistency c a b e = raise (Inconsistency (c,a,b,e))

  let pr i = "<"^string_of_int i^">"
end

include AG.Make(P)
