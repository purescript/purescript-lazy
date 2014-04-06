module Data.Lazy.List where

  import Data.Array
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
    show l = "List(" ++ joinWith (map show (toArray l)) "," ++ ")"

  instance monoidList :: Monoid (List a) where
    mempty = Nil

    (<>) Nil l = l
    (<>) l Nil = l
    (<>) (Cons x xs) ys = Cons x (defer \_ -> (force xs) <> ys)
    
  instance functorList :: Functor List where
    (<$>) = liftA1

  instance applicativeList :: Applicative List where
    pure = return
    (<*>) = ap

  instance monadList :: Monad List where
    return x = Cons x (defer \_ -> Nil)

    (>>=) Nil _ = Nil
    (>>=) (Cons x xs) f = f x <> (force xs >>= f)

  toArray :: forall a. List a -> [a]
  toArray Nil = []
  toArray (Cons x xs) = x : toArray (force xs)

  fromArray :: forall a. [a] -> List a
  fromArray [] = Nil
  fromArray (x:xs) = Cons x (defer \_ -> fromArray xs)

  repeat :: forall a. a -> List a
  repeat x = Cons x (defer \_ -> repeat x)

  takeList :: forall a. Number -> List a -> List a
  takeList n _ | n < 1   = Nil
  takeList _ Nil         = Nil
  takeList n (Cons x xs) = Cons x (defer \_ -> takeList (n - 1) (force xs))

  dropList :: forall a. Number -> List a -> List a
  dropList n s | n < 1   = s
  dropList _ Nil         = Nil
  dropList n (Cons _ xs) = dropList (n - 1) (force xs)
