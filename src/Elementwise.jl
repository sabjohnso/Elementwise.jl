### file: Elementwise/src/Elementwise.jl

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
"
module Elementwise
------------------
A module exporting an abstract type, AbstractElementwise and a two methods
overloaded for subtypes of AbstractElementwise.  The methods are apply_unary
and apply_binary, which are exported from the module Applicator.
"
module Elementwise

import Applicator.apply_unary, Applicator.apply_binary
export AbstractElementwise, isElementwise, apply_unary, apply_binary


"
AbstractElementwise
-------------------
An abstract type facilitating the construction of types that
apply functions elementwise.  The methods of apply_unary and
apply_binary are derived from methods of map, which must be
defined for subtypes of AbstracftElementwise.
"
abstract AbstractElementwise


#
# ... Type predicate
#

isElementwise( x ) = typeof( x ) <: AbstractElementwise

#
# ... Function application methods
#

apply_unary( f, x::AbstractElementwise ) = map( f, x )
apply_binary{ T <: AbstractElementwise }( f, x::T, y::T ) = map( f, x, y )
apply_binary{ T <: AbstractElementwise }( f, x::T, y ) = map( x -> f( x, y ), x )
apply_binary{ T <: AbstractElementwise }( f, x, y::T ) = map( y -> f( x, y ), y )

end # module
