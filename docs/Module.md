# Module Documentation

## Module Data.Lazy

#### `Lazy`

``` purescript
data Lazy :: * -> *
```


#### `defer`

``` purescript
defer :: forall a. (Unit -> a) -> Lazy a
```


#### `force`

``` purescript
force :: forall a. Lazy a -> a
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


#### `lazy1Lazy`

``` purescript
instance lazy1Lazy :: CL.Lazy1 Lazy
```



## Module Data.Lazy.List

#### `List`

``` purescript
data List a
  = Nil 
  | Cons a (Lazy (List a))
```


#### `eqList`

``` purescript
instance eqList :: (Eq a) => Eq (List a)
```


#### `showList`

``` purescript
instance showList :: (Show a) => Show (List a)
```


#### `semigroupList`

``` purescript
instance semigroupList :: Semigroup (List a)
```


#### `monoidList`

``` purescript
instance monoidList :: Monoid (List a)
```


#### `functorList`

``` purescript
instance functorList :: Functor List
```


#### `applyList`

``` purescript
instance applyList :: Apply List
```


#### `applicativeList`

``` purescript
instance applicativeList :: Applicative List
```


#### `bindList`

``` purescript
instance bindList :: Bind List
```


#### `monadList`

``` purescript
instance monadList :: Monad List
```


#### `toArray`

``` purescript
toArray :: forall a. List a -> [a]
```


#### `fromArray`

``` purescript
fromArray :: forall a. [a] -> List a
```


#### `repeat`

``` purescript
repeat :: forall a. a -> List a
```


#### `take`

``` purescript
take :: forall a. Number -> List a -> List a
```


#### `drop`

``` purescript
drop :: forall a. Number -> List a -> List a
```