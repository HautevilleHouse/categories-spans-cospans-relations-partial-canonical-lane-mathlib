import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure RelationObject where
  carrier : Type u
  relation : carrier → carrier → Prop
deriving Repr

structure RelationMorphism (A B : RelationObject) where
  map : A.carrier → B.carrier
  respects : ∀ x y, A.relation x y → B.relation (map x) (map y)
deriving Repr

structure RelationCategory where
  objects : Type u
  hom : objects → objects → Type v
  identity : ∀ X : objects, hom X X
  composition : ∀ {X Y Z : objects}, hom Y Z → hom X Y → hom X Z
  identityLeft : ∀ {X Y : objects} (f : hom X Y), composition (identity Y) f = f
  identityRight : ∀ {X Y : objects} (f : hom X Y), composition f (identity X) = f
  associativity : ∀ {X Y Z W : objects} (f : hom Z W) (g : hom Y Z) (h : hom X Y), composition (composition f g) h = composition f (composition g h)
  bridgeClosed : bridgeClosed A
  gateClosed : gateClosed A

theorem relation_category_closed (A : AdmissibleClass) (rc : RelationCategory) : bridgeClosed A ∧ gateClosed A :=
  And.intro rc.bridgeClosed rc.gateClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse