# Elementwise

###  Derived Elementwise Operations

[![Build Status](http://travis-ci.org/sabjohnso/Elementwise.jl.svg?branch=master)](https://travis-ci.org/sabjohnso/Elementwise.jl)
[![codecov.io](http://codecov.io/github/sabjohnso/Elementwise.jl/coverage.svg?branch=master)](http://codecov.io/github/sabjohnso/Elementwise.jl?branch=master)


### Getting Started

```julia
import Base.map

using Elementwise

type MyType <: Elementwise
  x
  y
end
map( f, a::MyType ) = MyType( f( x ), f( y ))
map( f, a::MyType, b::MyType ) = MyType( f( a.x, b.x ), f( a.y, b.y ))


a = MyType( 1, 2 )
println( apply_unary( x -> x*x, a ))
println( apply_binary( +, a, a ))

```

```julia
MyType(1,4)
MyType(2,4)
```
