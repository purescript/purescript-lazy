module Data.Lazy where

foreign import data Lazy :: * -> *

foreign import defer 
  "function defer(f) {\
  \  return (function() {\
  \    function Lazy(f) {\
  \      var self = this;\
  \      var value;\
  \      self.force = function() {\
  \        if (self.value === undefined) {\
  \          self.value = f();\
  \        }\
  \        return self.value;\
  \      };\
  \    }\
  \    return new Lazy(f);\
  \  }());\
  \}" :: forall a. ({} -> a) -> Lazy a

foreign import force
  "function force(l) {\
  \  return l.force();\
  \}" :: forall a. Lazy a -> a

instance monadLazy :: Monad Lazy where
  return a = defer $ \_ -> a
  (>>=) l f = defer $ \_ -> force <<< f <<< force $ l

instance applicativeLazy :: Applicative Lazy where
  pure = return
  (<*>) f x = defer $ \_ -> force f $ force x

instance functorLazy :: Functor Lazy where
  (<$>) f l = defer $ \_ -> f (force l)

fix :: forall a. (Lazy a -> Lazy a) -> Lazy a
fix f = f (defer $ \_ -> force $ fix f)
