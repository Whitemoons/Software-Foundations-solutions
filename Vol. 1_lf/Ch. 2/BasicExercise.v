(* Data and Functions *)
(** Boolean **)
(* Exercise: 1 star, standard (nandb) *)
(* Definition nandb (b1:bool) (b2:bool) : bool :=
    match b1 with
    | true => negb b2
    | false => true
    end. *)

Definition nandb (b1:bool) (b2:bool) : bool :=
    negb (b1 && b2).

Example test_nandb1: (nandb true false) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb2: (nandb false false) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb3: (nandb false true) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb4: (nandb true true) = false.
Proof. simpl. reflexivity. Qed.


(* Exercise: 1 star, standard (andb3) *)
(*    
    Do the same for the [andb3] function below. This function should
    return [true] when all of its inputs are [true], and [false]
    otherwise. 
*)
Definition andb3 (b1:bool) (b2:bool) (b3:bool) : bool :=
    b1 && b2 && b3.

Example test_andb31: (andb3 true true true) = true.
Proof. simpl. reflexivity. Qed.

Example test_andb32: (andb3 false true true) = false.
Proof. simpl. reflexivity. Qed.

Example test_andb33: (andb3 true false true) = false.
Proof. simpl. reflexivity. Qed.

Example test_andb34: (andb3 true true false) = false.
Proof. simpl. reflexivity. Qed.


(** Numbers **)
(* Exercise: 1 star, standard (factorial) *)
(*
    Recall the standard mathematical factorial function:

       factorial(0)  =  1
       factorial(n)  =  n * factorial(n-1)     (if n>0)

    Translate this into Coq.

    Make sure you put a [:=] between the header we've provided and
    your definition.  If you see an error like "The reference
    factorial was not found in the current environment," it means
    you've forgotten the [:=]. 
*)

Fixpoint factorial (n: nat): nat :=
    match n with
    | O => S O
    | S n' => mult n (factorial n')
    end.

Example test_factorial1:          (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.

Example test_factorial2:          (factorial 5) = (mult 10 12).
Proof. simpl. reflexivity. Qed.


(* Exercise: 1 star, standard (ltb) *)
(* 
    The [ltb] function tests natural numbers for [l]ess-[t]han,
    yielding a [b]oolean.  Instead of making up a new [Fixpoint] for
    this one, define it in terms of a previously defined
    function.  (It can be done with just one previously defined
    function, but you can use two if you want.) 
*)

Fixpoint eqb (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => eqb n' m'
            end
  end.

Definition ltb (n m: nat): bool :=
    eqb (n - m) O && negb (eqb (m - n) O).

Notation "x <? y" := (ltb x y) (at level 70) : nat_scope.

Example test_ltb1:             (ltb 2 2) = false.
Proof. simpl. reflexivity. Qed.

Example test_ltb2:             (ltb 2 4) = true.
Proof. simpl. reflexivity. Qed.

Example test_ltb3:             (ltb 4 2) = false.
Proof. simpl. reflexivity. Qed.


(** Proof by Rewriting **)
(* Exercise: 1 star, standard (plus_id_exercise) *)
(*
    Remove "[Admitted.]" and fill in the proof.  (Note that the
    theorem has _two_ hypotheses -- [n = m] and [m = o] -- each to the
    left of an implication arrow.)
*)    

Theorem plus_id_exercise : forall n m o : nat,
  n = m -> m = o -> n + m = m + o.
Proof.
  intros n m o.
  intros H1 H2.
  rewrite -> H1.
  rewrite -> H2.
  reflexivity.
Qed.


(* Exercise: 1 star, standard (mult_n_1) *)
(* 
    Use [mult_n_Sm] and [mult_n_0] to prove the following
    theorem.  (Recall that [1] is [S O].) 
*)

Check mult_n_O.
Check mult_n_Sm.

Theorem mult_n_1 : forall p : nat,
  p * 1 = p.
Proof.
  intros p.
  rewrite <- mult_n_Sm.
  rewrite <- mult_n_O.
  reflexivity.
Qed.


(** Proof by Case Analysis **)
(* Exercise: 2 stars, standard (andb_true_elim2) *)
(*
    Prove the following claim, marking cases (and subcases) with
    bullets when you use [destruct].

    Hint: You will eventually need to destruct both booleans, as in
    the theorems above. But its best to delay introducing the
    hypothesis until after you have an opportunity to simplify it.

    Hint 2: When you reach a contradiction in the hypotheses, focus on
    how to [rewrite] with that contradiction. 
*)

From Coq Require Import Bool BoolEq.
Require Import Coq.Setoids.Setoid.

Check andb_true_iff.

Theorem andb_true_elim2 : forall b c : bool,
  andb b c = true -> c = true.
Proof.
  intros b c H.
  rewrite andb_true_iff in H.
  destruct H as [_ Hc].
  exact Hc.
Qed.