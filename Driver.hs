{-# LANGUAGE NoMonomorphismRestriction #-}
module Driver where
import Language
import Compiler
import Parser
import Lexer
import TypeChecker hiding (optimiseTypeScheme)
import Solver
import UserType
import Interpreter
import Control.Monad
import Control.Monad.Reader
import Data.Unique
import qualified Data.Map as M


compile p = putStrLn $ runCompiler $ (lambdaM (const $ (runEval' (SymbolTable M.empty M.empty M.empty) $ parseProgram (runLexer p)) >> voidValue)) >> return ()


interpret p = runInterpreter ((runEval' (SymbolTable M.empty (M.fromList [(Def "print",Wrap printFunc)]) M.empty) $ parseProgram $ runLexer p) >> voidValue)


infertype p = do
  Ungen (UngenVar _ t) <- (flip runReaderT undefined $ runConstraintGen $ liftM unWrap $ runEval' (SymbolTable M.empty M.empty M.empty) $ parseExp (runLexer p))
  showTypeGraph t
  putStrLn ""
  TypeScheme [] t <- optimiseTypeScheme $ TypeScheme [] t
  showTypeGraph t
  putStrLn ""
  ut <- toUserType t
  print ut

inferprog p = do
  genID <- newUnique
  (flip runReaderT (GeneralisationLevel{generalisationID=GeneralisationID genID, importedVars=error "can't import var"}) $ runConstraintGen $ (runEval' (SymbolTable M.empty M.empty M.empty) $ parseProgram (runLexer p)) >> voidValue)

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