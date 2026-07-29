import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure PartialObject where
  carrier : Type u
  defined : carrier → Prop
deriving Repr

structure PartialMorphism (A B : PartialObject) where
  map : A.carrier → B.carrier
  definedPreserved : ∀ x, A.defined x → B.defined (map x)
deriving Repr

structure PartialCategory where
  objects : Type u
  hom : objects → objects → Type v
  identity : ∀ X : objects, hom X X
  composition : ∀ {X Y Z : objects}, hom Y Z → hom X Y → hom X Z
  identityLeft : ∀ {X Y : objects} (f : hom X Y), composition (identity Y) f = f
  identityRight : ∀ {X Y : objects} (f : hom X Y), composition f (identity X) = f
  associativity : ∀ {X Y Z W : objects} (f : hom Z W) (g : hom Y Z) (h : hom X Y), composition (composition f g) h = composition f (composition g h)
  bridgeClosed : bridgeClosed A
  gateClosed : gateClosed A

theorem partial_category_closed (A : AdmissibleClass) (pc : PartialCategory) : bridgeClosed A ∧ gateClosed A :=
  And.intro pc.bridgeClosed pc.gateClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse