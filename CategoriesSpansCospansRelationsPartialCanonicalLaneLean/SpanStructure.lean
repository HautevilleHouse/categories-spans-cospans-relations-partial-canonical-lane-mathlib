import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure SpanObject where
  apex : Type u
  leftLeg : apex → Type v
  rightLeg : apex → Type w
deriving Repr

structure SpanMorphism (A B : SpanObject) where
  domainMap : A.apex → B.apex
  leftNatural : ∀ x, A.leftLeg x → B.leftLeg (domainMap x)
  rightNatural : ∀ x, A.rightLeg x → B.rightLeg (domainMap x)
deriving Repr

structure SpanCategory where
  objects : Type u
  hom : objects → objects → Type v
  identity : ∀ X : objects, hom X X
  composition : ∀ {X Y Z : objects}, hom Y Z → hom X Y → hom X Z
  identityLeft : ∀ {X Y : objects} (f : hom X Y), composition (identity Y) f = f
  identityRight : ∀ {X Y : objects} (f : hom X Y), composition f (identity X) = f
  associativity : ∀ {X Y Z W : objects} (f : hom Z W) (g : hom Y Z) (h : hom X Y), composition (composition f g) h = composition f (composition g h)
  bridgeClosed : bridgeClosed A -- A is an AdmissibleClass from context
  gateClosed : gateClosed A

theorem span_category_closed (A : AdmissibleClass) (sc : SpanCategory) : bridgeClosed A ∧ gateClosed A :=
  And.intro sc.bridgeClosed sc.gateClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse