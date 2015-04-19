# Module Documentation

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

#### `semiringLazy`

``` purescript
instance semiringLazy :: (Semiring a) => Semiring (Lazy a)
```


#### `ringLazy`

``` purescript
instance ringLazy :: (Ring a) => Ring (Lazy a)
```


#### `moduloSemiringLazy`

``` purescript
instance moduloSemiringLazy :: (ModuloSemiring a) => ModuloSemiring (Lazy a)
```


#### `divisionRingLazy`

``` purescript
instance divisionRingLazy :: (DivisionRing a) => DivisionRing (Lazy a)
```


#### `numLazy`

``` purescript
instance numLazy :: (Num a) => Num (Lazy a)
```


#### `eqLazy`

``` purescript
instance eqLazy :: (Eq a) => Eq (Lazy a)
```


#### `ordLazy`

``` purescript
instance ordLazy :: (Ord a) => Ord (Lazy a)
```


#### `boundedLazy`

``` purescript
instance boundedLazy :: (Bounded a) => Bounded (Lazy a)
```


#### `semigroupLazy`

``` purescript
instance semigroupLazy :: (Semigroup a) => Semigroup (Lazy a)
```


#### `monoidLazy`

``` purescript
instance monoidLazy :: (Monoid a) => Monoid (Lazy a)
```


#### `latticeLazy`

``` purescript
instance latticeLazy :: (Lattice a) => Lattice (Lazy a)
```


#### `boundedLatticeLazy`

``` purescript
instance boundedLatticeLazy :: (BoundedLattice a) => BoundedLattice (Lazy a)
```


#### `complementedLatticeLazy`

``` purescript
instance complementedLatticeLazy :: (ComplementedLattice a) => ComplementedLattice (Lazy a)
```


#### `distributiveLatticeLazy`

``` purescript
instance distributiveLatticeLazy :: (DistributiveLattice a) => DistributiveLattice (Lazy a)
```


#### `booleanAlgebraLazy`

``` purescript
instance booleanAlgebraLazy :: (BooleanAlgebra a) => BooleanAlgebra (Lazy a)
```


#### `functorLazy`

``` purescript
instance functorLazy :: Functor Lazy
```


#### `applyLazy`

``` purescript
instance applyLazy :: Apply Lazy
```


#### `applicativeLazy`

``` purescript
instance applicativeLazy :: Applicative Lazy
```


#### `bindLazy`

``` purescript
instance bindLazy :: Bind Lazy
```


#### `monadLazy`

``` purescript
instance monadLazy :: Monad Lazy
```


#### `extendLazy`

``` purescript
instance extendLazy :: Extend Lazy
```


#### `comonadLazy`

``` purescript
instance comonadLazy :: Comonad Lazy
```


#### `showLazy`

``` purescript
instance showLazy :: (Show a) => Show (Lazy a)
```


#### `lazyLazy`

``` purescript
instance lazyLazy :: CL.Lazy (Lazy a)
```




