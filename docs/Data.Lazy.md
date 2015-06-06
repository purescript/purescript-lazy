## Module Data.Lazy

A monad for lazily-computed values

#### `Lazy`

``` purescript
data Lazy :: * -> *
```

`Lazy a` represents lazily-computed values of type `a`.

A lazy value is computed at most once - the result is saved
after the first computation, and subsequent attempts to read
the value simply return the saved value.

`Lazy` values can be created with `defer`, or by using the provided
type class instances.

`Lazy` values can be evaluated by using the `force` function.

##### Instances
``` purescript
instance semiringLazy :: (Semiring a) => Semiring (Lazy a)
instance ringLazy :: (Ring a) => Ring (Lazy a)
instance moduloSemiringLazy :: (ModuloSemiring a) => ModuloSemiring (Lazy a)
instance divisionRingLazy :: (DivisionRing a) => DivisionRing (Lazy a)
instance numLazy :: (Num a) => Num (Lazy a)
instance eqLazy :: (Eq a) => Eq (Lazy a)
instance ordLazy :: (Ord a) => Ord (Lazy a)
instance boundedLazy :: (Bounded a) => Bounded (Lazy a)
instance boundedOrdLazy :: (BoundedOrd a) => BoundedOrd (Lazy a)
instance semigroupLazy :: (Semigroup a) => Semigroup (Lazy a)
instance monoidLazy :: (Monoid a) => Monoid (Lazy a)
instance booleanAlgebraLazy :: (BooleanAlgebra a) => BooleanAlgebra (Lazy a)
instance functorLazy :: Functor Lazy
instance applyLazy :: Apply Lazy
instance applicativeLazy :: Applicative Lazy
instance bindLazy :: Bind Lazy
instance monadLazy :: Monad Lazy
instance extendLazy :: Extend Lazy
instance comonadLazy :: Comonad Lazy
instance showLazy :: (Show a) => Show (Lazy a)
instance lazyLazy :: Lazy (Lazy a)
```

#### `defer`

``` purescript
defer :: forall a. (Unit -> a) -> Lazy a
```

Defer a computation, creating a `Lazy` value.

#### `force`

``` purescript
force :: forall a. Lazy a -> a
```

Force evaluation of a `Lazy` value.


