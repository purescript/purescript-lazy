module Main where

import Data.Lazy
import Data.Maybe
import Debug.Trace
import Control.Monad.Eff
import Test.QuickCheck

instance arbLazy :: (Arb a) => Arb (Lazy a) where
  arb = do
    x <- arb
    return $ defer \_ -> x
    
main = do

  trace "test identity"
  quickCheck identity
  
  trace "test equality"
  quickCheck equality
  
  trace "test monad laws"
  quickCheck monadLeftIdentity
  quickCheck monadRightIdentity
  quickCheck monadAssociativity
  
  trace "test show"
  quickCheck show'
  
  where
  
  identity :: Number -> Boolean
  identity x = force (defer \_ -> x) == x

  equality :: Number -> Boolean
  equality x = (defer \_ -> x) == (defer \_ -> x)

  monadLeftIdentity :: Number -> Boolean
  monadLeftIdentity x = (return x >>= f) == (f x)
    where
    f x = defer \_ -> x * x
    
  monadRightIdentity :: Lazy Number -> Boolean
  monadRightIdentity m = (m >>= return) == m
    
  monadAssociativity :: Lazy Number -> Boolean
  monadAssociativity m = ((m >>= f) >>= g) == (m >>= (\x -> f x >>= g))
    where
    f x = return $ x * x
    g x = return $ -x
    
  show' :: Number -> Boolean
  show' x = show (defer \_ -> x) == "Lazy " ++ (show x)
