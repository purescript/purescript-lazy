-- | A monad for lazily-computed values

module Data.Lazy where

import Prelude

import Control.Comonad (Comonad)
import Control.Extend (Extend)
import Data.Monoid (Monoid, mempty)
import qualified Control.Lazy as CL

-- | `Lazy a` represents lazily-computed values of type `a`.
-- |
-- | A lazy value is computed at most once - the result is saved
-- | after the first computation, and subsequent attempts to read
-- | the value simply return the saved value.
-- |
-- | `Lazy` values can be created with `defer`, or by using the provided
-- | type class instances.
-- |
-- | `Lazy` values can be evaluated by using the `force` function.
foreign import data Lazy :: * -> *

-- | Defer a computation, creating a `Lazy` value.
foreign import defer :: forall a. (Unit -> a) -> Lazy a

-- | Force evaluation of a `Lazy` value.
foreign import force :: forall a. Lazy a -> a

instance semiringLazy :: (Semiring a) => Semiring (Lazy a) where
  add a b = defer \_ -> force a + force b
  zero = defer \_ -> zero
  mul a b = defer \_ -> force a * force b
  one = defer \_ -> one

instance ringLazy :: (Ring a) => Ring (Lazy a) where
  sub a b = defer \_ -> force a - force b

instance moduloSemiringLazy :: (ModuloSemiring a) => ModuloSemiring (Lazy a) where
  div a b = defer \_ -> force a / force b
  mod a b = defer \_ -> force a `mod` force b

instance divisionRingLazy :: (DivisionRing a) => DivisionRing (Lazy a)

instance numLazy :: (Num a) => Num (Lazy a)

instance eqLazy :: (Eq a) => Eq (Lazy a) where
  eq x y = (force x) == (force y)

instance ordLazy :: (Ord a) => Ord (Lazy a) where
  compare x y = compare (force x) (force y)

instance boundedLazy :: (Bounded a) => Bounded (Lazy a) where
  top = defer \_ -> top
  bottom = defer \_ -> bottom

instance boundedOrdLazy :: (BoundedOrd a) => BoundedOrd (Lazy a)

instance semigroupLazy :: (Semigroup a) => Semigroup (Lazy a) where
  append a b = defer \_ -> force a <> force b

instance monoidLazy :: (Monoid a) => Monoid (Lazy a) where
  mempty = defer \_ -> mempty

instance booleanAlgebraLazy :: (BooleanAlgebra a) => BooleanAlgebra (Lazy a) where
  conj a b = conj <$> a <*> b
  disj a b = disj <$> a <*> b
  not a = not <$> a

instance functorLazy :: Functor Lazy where
  map f l = defer \_ -> f (force l)

instance applyLazy :: Apply Lazy where
  apply f x = defer \_ -> force f $ force x

instance applicativeLazy :: Applicative Lazy where
  pure a = defer \_ -> a

instance bindLazy :: Bind Lazy where
  bind l f = defer \_ -> force <<< f <<< force $ l

instance monadLazy :: Monad Lazy

instance extendLazy :: Extend Lazy where
  extend f x = defer \_ -> f x

instance comonadLazy :: Comonad Lazy where
  extract = force

instance showLazy :: (Show a) => Show (Lazy a) where
  show x = "Lazy " ++ show (force x)

instance lazyLazy :: CL.Lazy (Lazy a) where
  defer f = defer \_ -> force (f unit)
