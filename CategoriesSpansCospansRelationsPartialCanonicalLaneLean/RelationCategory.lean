import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure Relation (A B : Type u) where
  graph : Set (A × B)

def identityRelation (A : Type u) : Relation A A :=
  { graph := { (a, a) | a : A } }

def composeRelations {A B C : Type u} (R : Relation A B) (S : Relation B C) : Relation A C :=
  { graph := { (a, c) | ∃ b : B, (a, b) ∈ R.graph ∧ (b, c) ∈ S.graph } }

def inverseRelation {A B : Type u} (R : Relation A B) : Relation B A :=
  { graph := { (b, a) | (a, b) ∈ R.graph } }

structure RelationCategory where
  Obj : Type u
  Hom : Obj → Obj → Type u
  identity : (X : Obj) → Hom X X
  compose : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z

structure RelationAdmissibleClass extends AdmissibleClass where
  relation : RelationCategory
  closureUnderComposition : Prop
  closureWitness : closureUnderComposition

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse