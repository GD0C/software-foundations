let rec gcd a b =
    if b = 0 then a
  else gcd b (a mod b);;

Printf.printf "%d\n" (gcd 28 20);;

let value = gcd 28 20;;

Printf.printf "%d\n" value;

