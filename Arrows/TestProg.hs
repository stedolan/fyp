module TestProg where
import Language


-- sum the integers 1 through 10 inclusive
sampleProgram = 
    let i = Var "i"
        x = Var "x"
        max = VarRef (Var "max")
        seq = foldr1 Seq
    in seq[seq 
      [Asgn i (LitInt 1),
       Asgn x (LitInt 0),
       While (BinOpE OpNeq (VarRef i) (BinOpE OpPlus max (LitInt 1))) (seq 
       [Asgn x (BinOpE OpPlus (VarRef x) (VarRef i)),
        Asgn i (BinOpE OpPlus (VarRef i) (LitInt 1))])],
       Asgn x (BinOpE OpPlus (VarRef x) (VarRef x))]

