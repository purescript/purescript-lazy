module Data.Lazy.List 
  ( List(..)
  , toArray
  , fromArray
  , repeat
  , take
  , drop
  ) where

import Data.Array (map)
import Data.Foldable
import Data.Lazy
import Data.Monoid
import Data.Traversable

data List a = Nil | Cons a (Lazy (List a))

instance eqList :: (Eq a) => Eq (List a) where
  (==) Nil         Nil         = true
  (==) (Cons x xs) (Cons y ys) = x == y && (force xs) == (force ys)
  (==) _           _           = false

  (/=) l           l'          =  not (l == l')

instance showList :: (Show a) => Show (List a) where
  show l = "List(" ++ showItems (map show (toArray l)) ++ ")"
  
foreign import showItems
  "function showItems (l) {\
  \  return l.join(', ');\
  \}" :: [String] -> String

instance semigroupList :: Semigroup (List a) where
  (<>) xs ys = xs <.> defer \_ -> ys

(<.>) :: forall a. List a -> Lazy (List a) -> List a
(<.>) Nil         ys = force ys
(<.>) (Cons x xs) ys = Cons x ((\xs' -> xs' <.> ys) <$> xs)

instance monoidList :: Monoid (List a) where
  mempty = Nil
  
instance functorList :: Functor List where
  (<$>) f Nil = Nil
  (<$>) f (Cons h t) = Cons (f h) (((<$>) f) <$> t)

instance applyList :: Apply List where
  (<*>) = ap

instance applicativeList :: Applicative List where
  pure x = Cons x (defer \_ -> Nil)

instance bindList :: Bind List where
  (>>=) Nil _ = Nil
  (>>=) (Cons x xs) f = f x <.> ((\xs' -> xs' >>= f) <$> xs)

instance monadList :: Monad List

toArray :: forall a. List a -> [a]
toArray Nil = []
toArray (Cons x xs) = x : toArray (force xs)

fromArray :: forall a. [a] -> List a
fromArray [] = Nil
fromArray (x:xs) = Cons x (defer \_ -> fromArray xs)

repeat :: forall a. a -> List a
repeat x = Cons x (defer \_ -> repeat x)

take :: forall a. Number -> List a -> List a
take n _ | n < 1   = Nil
take _ Nil         = Nil
take n (Cons x xs) = Cons x (defer \_ -> take (n - 1) (force xs))

drop :: forall a. Number -> List a -> List a
drop n s | n < 1   = s
drop _ Nil         = Nil
drop n (Cons _ xs) = drop (n - 1) (force xs)
