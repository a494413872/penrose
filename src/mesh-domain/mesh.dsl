-- Keenan's notes:
-- http://brickisland.net/DDGSpring2019/
-- https://www.cs.cmu.edu/~kmcrane/Projects/DDG/paper.pdf (chapter 2)
-- http://brickisland.net/DDGSpring2019/2019/01/22/a0-coding-combinatorial-surfaces/

-- geometry-processing-js types and classes:
-- https://geometrycollective.github.io/geometry-processing-js/docs/module-Core.html
-- https://geometrycollective.github.io/geometry-processing-js/docs/module-Projects.SimplicialComplexOperators.html

-- Other resources:
-- https://github.com/cmu462/Scotty3D/wiki/Edge-Flip-Tutorial
-- https://github.com/cmu462/Scotty3D/wiki/Local-Mesh-Operations

tconstructor Vertex : type
tconstructor Edge : type
tconstructor Face : type
tconstructor SSubset : type
tconstructor SComplex : type -- Mesh := SComplex(2)
tconstructor Subcomplex : type -- (V, E, F) linked to a mesh

SComplex <: SSubset
Subcomplex <: SSubset
-- Subcomplex <: SComplex 
-- TODO: Technically true, but messes up our Style matching

vconstructor MkEdge(v1 : Vertex, v2 : Vertex) : Edge
vconstructor MkFace(e1 : Edge, e2 : Edge, e3 : Edge) : Face

operator Star(c : SComplex) : SSubset
operator StarV(v : Vertex) : SSubset -- This operator does not include the simplicial complex that v is in
operator Closure(s : SSubset) : Subcomplex
operator Link(s : SSubset) : SSubset
operator LinkV(v : Vertex) : SSubset
operator Boundary(s : SComplex) : SSubset
operator Coboundary(s : SSubset) : SSubset
operator ToSComplex(s : SSubset) : SComplex

-- Math-related predicates
predicate IsSubsetOf(s : SSubset, c : SComplex) : Prop
predicate IsSComplex(s : SSubset) : Prop
predicate Pure(s : SSubset) : Prop
predicate IsBoundary(s : SSubset) : Prop -- Not sure how to check it

-- Generic connectivity and selection predicates
-- Does this work WRT subtyping?
predicate InVE(v : Vertex, e : Edge) : Prop
predicate InEF(e : Edge, f : Face) : Prop

predicate InVS(v : Vertex, s : SSubset) : Prop
predicate InES(e : Edge, s : SSubset) : Prop
predicate InFS(f : Face, s : SSubset) : Prop

-- For plugin use
predicate DeclaredV(v : Vertex) : Prop
predicate DeclaredE(e : Edge) : Prop
predicate DeclaredF(f : Face) : Prop