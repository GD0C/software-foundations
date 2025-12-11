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
    unit_test (length [] = 0) "list []" ;; 

let length_test () =
    unit_test (length [1; 2; 3] = 3) "length [1; 2; 3] = 3";;
    unit_test (length [1; 2] = 2) "length [1; 2] = 2";;
    unit_test (length [1] = 1) "length [1]";;
    unit_test (length [] = 0) "length []";;
    

length_test ();;


let rec increment_all_in_list (list : int list) : int list = 
    match list with
        | [] -> []
        | h :: t -> (1 + h) :: (increment_all_in_list t);;


let increment_test_one () =
    unit_test (increment_all_in_list [1;2;3] = [2;3;4]) "[1, 2, 3] => [2, 3, 4]";;
    unit_test (increment_all_in_list [2;3;4] = [3;4;5]) "[2, 3, 4] => [3, 4, 5]";;

increment_test_one ();;

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

let rec map (f : int -> int) (list : int list) : int list =
    match list with
      | [] -> []
      | h :: t -> (f h) :: (map f t);;



let inc_all (list : int list) : int list = 
    map (fun x -> x + 1) list;;

let increment_test_two () =
    unit_test (inc_all [1;2;3;] = [2;3;4]) "Second Increment function: [1, 2, 3] => [2, 3, 4]";;

increment_test_two ();;


let sqre_all (list : int list) : int list =
    map (fun x -> x * x) list;;


let sqre_test () =
    unit_test (sqre_all [1; 2; 3; 4] = [1; 4; 9; 16]) "Squaring list function: [1, 2, 3, 4] => [1, 4, 9, 16]";;
    unit_test (sqre_all [1; 2; 3; 4; 5; 6; 7; 8; 9] = [1; 4; 9; 16; 25; 36; 49; 64; 81]) "Squaring list function: [1, 2, 3, 4, 5, 6, 7, 8, 9] => [1, 4, 9, 16, 25, 36, 49, 64, 81]";;

sqre_test ();;




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



let rec fold (f: int -> int -> int) (list : int list) (acc: int) : int =
    match list with
      | [] -> acc
      | h :: t -> f h (fold f t acc);;



let sum (list : int list) : int =
    fold (+) list 0;;


let sum_test () =
    unit_test (sum [1; 2; 3; 4; 5; 6; 7; 8; 9] = 45) "sum [1, 2, 3, 4, 5, 6, 7, 8, 9] = 45";;
    unit_test (sum [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] = 450) "sum [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] = 450";;

sum_test ();;

let product (list : int list) : int =
    fold ( * ) list 1;;

let product_test () =
    unit_test (product [1; 2; 3; 4; 5; 6; 7; 8; 9] = 3628800) "product [1, 2, 3, 4, 5, 6, 7, 8, 9] = 3628800";;
    unit_test (product [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] = 36288000) "product [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] = 36288000";;

product_test ();;

Printf.printf "Product [1...10]: %d\n" (product [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]);;
Printf.printf "Product [1...9]: %d\n" (product [1; 2; 3; 4; 5; 6; 7; 8; 9]);;


let rewrite_length (list : int list) : int =
    fold (fun _h acc -> 1 + acc) list 0;;

let rewrite_length_test () =
    unit_test (rewrite_length [1; 2; 3; 4; 5; 6; 7; 8; 9] = 9) "rewrite_length [1, 2, 3, 4, 5, 6, 7, 8, 9] = 9";;

rewrite_length_test ();;



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
      | h :: t -> if test h then h :: (filter test t) else filter test t;;


let evens (list : int list) : int list =
    filter (fun x -> x mod 2 = 0) list;;

let positives (list : int list) : int list = 
    filter (fun x -> x > 0) list;;

(* Above is essentially building the standard library for filter, map, and fold on a list *)


(*
  Record
*)

type person = {
    firstname : string;
    lastname : string;
    birthyear : int;
  }

let me : person = {
    firstname = "andrew";
    lastname = "boss";
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



let my_person : person = {firstname = "John"; lastname = "Doe"; birthyear = 1997}



let {firstname; lastname;} = my_person;;



Printf.printf "%s %s\n" firstname lastname;;


Printf.printf "%s \n" fullname_two (me);;
Printf.printf "%s \n" fullname_three (me);;
Printf.printf "%s \n" fullname_oops (me);;




