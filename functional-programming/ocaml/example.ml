  let unit_test (test : bool) (message : string) : unit =
    if test then
      Printf.printf "%s passed\n" message 
    else
      Printf.printf "%s failed\n" message ;;


let rec factor (n : int) : int =
    if n = 0 then 1
    else n * factor(n - 1);;

let fact_test () = 
    unit_test (factor 5 = 120) "fact 5";;
    unit_test (factor 0 = 1) "fact 0";;
    unit_test (factor 1 = 1) "fact 1";;
    unit_test (factor 2 = 2) "fact 2";;
    unit_test (factor 3 = 6) "fact 3";;
    unit_test (factor 4 = 24) "fact 4";;

fact_test ();;

(* 
   ==========
   ||Lists||
  ==========
*)


let rec length (list : int list) : int =
    match list with
      | [] -> 0
      | _h :: t -> 1 + length t;;

let length_test () =
    unit_test (length [1] = 1) "length [1]";;
    unit_test (length [] = 0) "length []";;
    

length_test ();;

(*

 CODE IS REDUNDANT BEFORE USING MAPPER FUNCTION BECAUSE THERE IS COMMONALITIES 
 =============================================================================

let rec inc_all (list : int list) : int list = 
    match list with
      | [] -> []
      | h :: t -> (1 + h) :: (inc_all t);;




let rec sqre_all (list : int list) : int list = 
    match list with
      | [] -> []
      | h :: t -> (h * h) :: (sqre_all t);;


*)

(* Using some higher order functions *)

let rec map (f : int -> int) (xs : int list) : int list =
    match xs with
      | [] -> []
      | h :: t -> (f h) :: (map f t);;



let inc_all (list : int list) : int list = 
    map (fun x -> x + 1) list;;

let sqre_all (list : int list) : int list =
    map (fun x -> x * x) list;;



(*

  ANOTHER REDUNDANT CODE
========================

let rec sum (list : int list) : int =
    match list with
      | [] -> 0
      | h :: t -> h + (sum t);;

let rec product (list : int list) : int =
    match list with
      | [] -> 1
      | h :: t -> h * (product t);;
*)



let rec fold (f: int -> int -> int) (xs : int list) (acc: int) : int =
    match xs with
      | [] -> acc
      | h :: t -> f h (fold f t acc);;



let sum (list : int list) : int =
    fold (+) list 0;;

let product (list : int list) : int =
    fold ( * ) list 1;;

let rewrite_length (list : int list) : int =
    fold (fun _h acc -> 1 + acc) list 0;;

(*

THIS IS THE FILTER REDUNDADNT

let rec evens (list : int list) : int list =
    match list with 
      | [] -> []
      | h :: t -> if h mod 2 = 0 then h :: (evens t) else evens t;;

let rec positives (list : int list) : int list =
    match list with
      | [] -> []
      | h :: t -> if h > 0 then h :: (positives t) else positives t;;

  *)

let rec filter (test : int -> bool) (list : int list) : int list = 
    match list with
      | [] -> []
      | h :: t -> if test h then h :: (filter test t) else filter (test t);;

let evens (list : int list) : int list =
    filter (fun x -> x mod 2 = 0) list;;

let positives (list : int list) : int list = 
    filter (fun x -> x > 0) list;;


(*
  Record
*)

type person = {
    lastname : string;
    firstname : string;
    birthyear : int;
  }

let me : person = {
    lastname = "boss";
    firstname = "andrew";
    birthyear = 1997
  }


let fullname (p : person) : string =
    match p with
    | { lastname = ln; firstname = fn; _} -> fn ^ " " ^ ln;;

(* Or if we want to rewrite the function using same name reference *)


let fullname_two (p : person) : string = 
    match p with 
    | { lastname; firstname; _} -> firstname ^ " " ^ lastname;;


(* Or go full out TS on them *)

let fullname_three ({firstname; lastname; _} : person) : string =
    firstname ^ " " ^ lastname;;


(* ooper pooper version *)

let fullname_oops (p : person) : string = 
    p.firstname ^ " " ^ p.lastname;;


Printf.printf "%s \n" fullname (me);;
Printf.printf "%s \n" fullname_two (me);;
Printf.printf "%s \n" fullname_three (me);;
Printf.printf "%s \n" fullname_oops (me);;




