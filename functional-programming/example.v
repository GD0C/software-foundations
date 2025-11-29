Inductive day : type :=
  | Monday
  | Tuesday
  | Wednesday 
  | Thursday 
  | Friday 
  | Saturday 
  | Sunday. 

Definition next_work_day (d: day) : day :=
  match d with 
    | Monday => Tuesday
    | Tuesday => Wednesday
    | Wednesday => Thursday
    | Thursday => Friday
    | Friday => Monday
    | Saturday => Monday
    | Sunday => Monday
  end.





Compute (next_work_day Monday).
Compute (next_work_day (next_work_day Monday).

Example test_next_work_day:
  (next_work_day(next_work_day Saturday)) = Tuesday.

Proof. Simpl. reflexivity. Qed.



Inductive bool : Type := 
  | true
  | false.

Definition not (b: bool) : bool :=
  match b with
    | true => false 
    | false => true. 

Definition and (b: bool) (b_two: bool) : bool :=
  match b with
    | true => b_two 
    | false => false.

Definition or (b: bool) (b_two: bool) : bool :=
  match b with
    | true => true
    | false => b_two.


Example test_and:
  (and true true) = true.

Example test_and_alse:
  (and true false) = false.

Proof. Simpl. reflexivity. Qed.
