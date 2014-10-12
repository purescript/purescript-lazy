# Module Documentation

## Module Data.Lazy

### Types

    data Lazy :: * -> *


### Type Class Instances

    instance applicativeLazy :: Applicative Lazy

    instance applyLazy :: Apply Lazy

    instance bindLazy :: Bind Lazy

    instance comonadLazy :: Comonad Lazy

    instance eqLazy :: (Eq a) => Eq (Lazy a)

    instance extendLazy :: Extend Lazy

    instance functorLazy :: Functor Lazy

    instance lazy1Lazy :: CL.Lazy1 Lazy

    instance monadLazy :: Monad Lazy

    instance ordLazy :: (Ord a) => Ord (Lazy a)

    instance showLazy :: (Show a) => Show (Lazy a)


### Values

    defer :: forall a. (Unit -> a) -> Lazy a

    force :: forall a. Lazy a -> a


## Module Data.Lazy.List

### Types

    data List a where
      Nil :: List a
      Cons :: a -> Lazy (List a) -> List a


### Type Class Instances

    instance applicativeList :: Applicative List

    instance applyList :: Apply List

    instance bindList :: Bind List

    instance eqList :: (Eq a) => Eq (List a)

    instance functorList :: Functor List

    instance monadList :: Monad List

    instance monoidList :: Monoid (List a)

    instance semigroupList :: Semigroup (List a)

    instance showList :: (Show a) => Show (List a)


### Values

    drop :: forall a. Number -> List a -> List a

    fromArray :: forall a. [a] -> List a

    repeat :: forall a. a -> List a

    take :: forall a. Number -> List a -> List a

    toArray :: forall a. List a -> [a]