-- | A monad for lazily-computed values

module Data.Lazy where

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
foreign import defer
  """
  function defer(thunk) {
    if (this instanceof defer) {
      this.thunk = thunk;
      return this;
    } else {
      return new defer(thunk);
    }
  }
  defer.prototype.force = function () {
    var value = this.thunk();
    delete this.thunk;
    this.force = function () {
        return value;
    };
    return value;
  };
  """ :: forall a. (Unit -> a) -> Lazy a

-- | Force evaluation of a `Lazy` value.
foreign import force
  """
  function force(l) {
    return l.force();
  }
  """ :: forall a. Lazy a -> a

instance semiringLazy :: (Semiring a) => Semiring (Lazy a) where
  (+) a b = defer \_ -> force a + force b
  zero = defer \_ -> zero
  (*) a b = defer \_ -> force a * force b
  one = defer \_ -> one

instance ringLazy :: (Ring a) => Ring (Lazy a) where
  (-) a b = defer \_ -> force a - force b

instance moduloSemiringLazy :: (ModuloSemiring a) => ModuloSemiring (Lazy a) where
  (/) a b = defer \_ -> force a / force b
  mod a b = defer \_ -> force a `mod` force b

instance divisionRingLazy :: (DivisionRing a) => DivisionRing (Lazy a)

instance numLazy :: (Num a) => Num (Lazy a)

instance eqLazy :: (Eq a) => Eq (Lazy a) where
  (==) x y = (force x) == (force y)
  (/=) x y = not (x == y)

instance ordLazy :: (Ord a) => Ord (Lazy a) where
  compare x y = compare (force x) (force y)

instance boundedLazy :: (Bounded a) => Bounded (Lazy a) where
  top = defer \_ -> top
  bottom = defer \_ -> bottom

instance semigroupLazy :: (Semigroup a) => Semigroup (Lazy a) where
  (<>) a b = defer \_ -> force a <> force b

instance monoidLazy :: (Monoid a) => Monoid (Lazy a) where
  mempty = defer \_ -> mempty

instance latticeLazy :: (Lattice a) => Lattice (Lazy a) where
  sup a b = defer \_ -> force a `sup` force b
  inf a b = defer \_ -> force a `inf` force b

instance boundedLatticeLazy :: (BoundedLattice a) => BoundedLattice (Lazy a)

instance complementedLatticeLazy :: (ComplementedLattice a) => ComplementedLattice (Lazy a) where
  not a = defer \_ -> not (force a)

instance distributiveLatticeLazy :: (DistributiveLattice a) => DistributiveLattice (Lazy a)

instance booleanAlgebraLazy :: (BooleanAlgebra a) => BooleanAlgebra (Lazy a)

instance functorLazy :: Functor Lazy where
  (<$>) f l = defer \_ -> f (force l)

instance applyLazy :: Apply Lazy where
  (<*>) f x = defer \_ -> force f $ force x

instance applicativeLazy :: Applicative Lazy where
  pure a = defer \_ -> a

instance bindLazy :: Bind Lazy where
  (>>=) l f = defer \_ -> force <<< f <<< force $ l

instance monadLazy :: Monad Lazy

instance extendLazy :: Extend Lazy where
  (<<=) f x = defer \_ -> f x

instance comonadLazy :: Comonad Lazy where
  extract = force

instance showLazy :: (Show a) => Show (Lazy a) where
  show x = "Lazy " ++ show (force x)

instance lazyLazy :: CL.Lazy (Lazy a) where
  defer f = defer \_ -> force (f unit)
