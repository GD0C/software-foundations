type name = { first_name: string; last_name: string }
let is_over_eighteen (age: int) : bool = if age > 18 then true else false  
type person = { name: name; age: int; is_over_eighteen: bool }


let add_prompt = "Enter the number that you want to add: " ;;
print_endline add_prompt;;

let value: int = read_int();;

let create_prompt  = "Let's create a person: " ;;
let name_entry = "Please enter your name: " ;; 
(* 
Want to understand why the compiler was complaining about me having the add function about the input?
Why in general it's complaining about me having to close it with a ;; - maybe it's because it's io and that's a side-effect?
 *)
let add (x: int)  (y: int) : int = x + y

let add_one = add 1 
let second_number:  int = add_one value



let match_my_number (x : int) : string = match x with
  | 1 -> "one"
  | 2 -> "two"
  | 3 -> "three"
  | 56 -> "Well you manage to guess the lucky number" 
  | _ -> "something else";;

print_endline (match_my_number(second_number));;

print_endline create_prompt;; 
print_endline name_entry;; 
let my_name: string = read_line();;

print_endline my_name;;


