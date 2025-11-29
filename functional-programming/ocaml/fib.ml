  let rec fibbi n = 
    if n <= 1 then n else fibbi(n - 1) + fibbi(n - 2)

  let rec fibbi2 n =
    match n with
      | 0 -> 0
      | 1 -> 1
      | _ -> fibbi2(n - 1) + fibbi2(n - 2)



  type a = string
  let something: a = "hello"



  type element = 
    | Node of {
        value: int;
        left: element;
      }
    | Test of strin




  let myList = [1;2;3;4;5]
  for i = 0 to 5 do
    print_int(List.nth myList i)
  done


  let () =
    let time = Sys.time() in
    print_int(fibbi2(20));
    print_newline();
    Printf.printf "%f\n" (Sys.time() -. time)



