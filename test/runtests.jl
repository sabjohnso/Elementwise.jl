### file: Elementwise/test/runtests.jl

## Copyright (c) 2015 Samuel B. Johnson

## Author: Samuel B. Johnson <sabjohnso@yahoo.com>

## This file is lincesed under a two license system. For commercial use
## that is not compatible with the GPLv3, please contact the author.
## Otherwise, continue reading below.

## This file is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3, or (at your option)
## any later version.

## You should have received a copy of the GNU General Public License
## along with this program. If not, see <http://www.gnu.org/licenses/>.

### Code:

using Elementwise
using FactCheck

import Base.map, Base.==
#import Elementwise.apply_unary, Elementwise.apply_binary


type MyElementwise <: AbstractElementwise
    x
    y
    z
end

==( a::MyElementwise, b::MyElementwise ) = a.x == b.x && a.y == b.y && a.z == b.z
map( f, a::MyElementwise ) = MyElementwise( f( a.x ), f( a.y ), f( a.z ))
map( f, a::MyElementwise, b::MyElementwise ) = MyElementwise( f( a.x, b.x ), f( a.y, b.y ), f( a.z, b.z ))

twice( x ) = x+x
square( x ) = x*x

facts( "Elementwise" ) do
    
    @fact isElementwise( 2 ) --> false
    
    a = MyElementwise( 1, 2, 3 )

    @fact isElementwise( a ) --> true
    @fact apply_unary( twice,  a ) --> MyElementwise( 2, 4, 6 )
    @fact apply_unary( square, a ) --> MyElementwise( 1, 4, 9 )
    @fact apply_binary( +, a, 1 ) --> MyElementwise( 2, 3, 4 )
    @fact apply_binary( +, 1,  a ) --> MyElementwise( 2, 3, 4 )

    b = MyElementwise( 4, 5, 6 )

    @fact isElementwise( b ) --> true
    @fact apply_binary( +, a, b ) --> MyElementwise( 5, 7, 9 )


    
end


