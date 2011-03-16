{-# LANGUAGE NoMonomorphismRestriction #-}
module Driver where
import Language
import Compiler
import Parser
import Lexer
import TypeChecker
import Solver
import Interpreter
import Control.Monad
import qualified Data.Map as M


compile p = putStrLn $ runCompiler $ (lambdaM (const $ (runEval' (SymbolTable M.empty M.empty M.empty) $ parseProgram (runLexer p)) >> voidValue)) >> return ()


interpret p = runInterpreter ((runEval' (SymbolTable M.empty (M.fromList [(Def "print",Wrap printFunc)]) M.empty) $ parseProgram $ runLexer p) >> voidValue)


infertype p = showTypeGraph =<< (runConstraintGen $ liftM unWrap $ runEval' (SymbolTable M.empty M.empty M.empty) $ parseExp (runLexer p))

{-
testCoRec = letrec $ \fns -> do
              let f = fns !! 0
                  g = fns !! 1
              f' <- lambdaM $ \arg -> do
                      b <- condM arg
                      if b then applyM g arg else arg
              g' <- lambdaM $ \arg -> do
                      b <- condM arg
                      if b then arg else applyM g arg
              undefined-}