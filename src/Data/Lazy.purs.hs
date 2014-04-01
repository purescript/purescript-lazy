module Data.Lazy where

foreign import data Lazy :: * -> *

foreign import defer 
  "function defer(thunk) {\
  \    if (this instanceof defer) {\
  \      this.thunk = thunk;\
  \      return this;\
  \    } else {\
  \      return new defer(thunk);\
  \    }\
  \}\
  \defer.prototype.force = function () {\
  \    var value = this.thunk();\
  \    delete this.thunk;\
  \    this.force = function () {\
  \        return value;\
  \    };\
  \    return value;\
  \};" :: forall a. ({} -> a) -> Lazy a

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
  
instance eqLazy :: (Eq a) => Eq (Lazy a) where
  (==) x y = (force x) == (force y)
  (/=) x y = not (x == y)
  
instance ordLazy :: (Ord a) => Ord (Lazy a) where
  compare x y = compare (force x) (force y)
  
instance showLazy :: (Show a) => Show (Lazy a) where
  show x = "Lazy " ++ show (force x)

fix :: forall a. (Lazy a -> Lazy a) -> Lazy a
fix f = f (defer $ \_ -> force $ fix f)
