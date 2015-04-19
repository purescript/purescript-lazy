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


#### `eqLazy`

``` purescript
instance eqLazy :: (Eq a) => Eq (Lazy a)
```


#### `ordLazy`

``` purescript
instance ordLazy :: (Ord a) => Ord (Lazy a)
```


#### `showLazy`

``` purescript
instance showLazy :: (Show a) => Show (Lazy a)
```


#### `lazyLazy`

``` purescript
instance lazyLazy :: CL.Lazy (Lazy a)
```




