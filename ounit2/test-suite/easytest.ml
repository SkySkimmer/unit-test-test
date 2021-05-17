
open OUnit2
module G = Agraphlib.Intgraph


let error_add_twice _ =
  let g = G.empty in
  let g = G.add 0 g in
  match G.add 0 g with
  | _ -> assert_failure "no error when adding the same point twice"
  | exception G.AlreadyDeclared -> ()


let () = run_test_tt_main begin
    "hard test" >:::
    [
      "error when adding twice">:: error_add_twice;
      "error when adding twice2">:: error_add_twice;
      "error when adding twice3">:: error_add_twice;
      "error when adding twice">:: error_add_twice;

    ]
  end
