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

instance functorLazy :: Functor Lazy where
  (<$>) f l = defer $ \_ -> f (force l)

instance applyLazy :: Apply Lazy where
  (<*>) f x = defer $ \_ -> force f $ force x

instance applicativeLazy :: Applicative Lazy where
  pure a = defer $ \_ -> a

instance bindLazy :: Bind Lazy where
  (>>=) l f = defer $ \_ -> force <<< f <<< force $ l

instance monadLazy :: Monad Lazy 

fix :: forall a. (Lazy a -> Lazy a) -> Lazy a
fix f = f (defer $ \_ -> force $ fix f)
