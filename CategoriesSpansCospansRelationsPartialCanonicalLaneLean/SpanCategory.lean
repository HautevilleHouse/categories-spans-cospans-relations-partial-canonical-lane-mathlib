import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure SpanCategory (C : Type u) [Category C] where
  apex : C
  leftLeg : apex ⟶ domain
  rightLeg : apex ⟶ codomain
  domain : C
  codomain : C

structure SpanComposition {C : Type u} [Category C] {X Y Z : C}
    (S : SpanCategory C) (T : SpanCategory C)
    (hS : S.codomain = X) (hT : T.domain = X) (hT' : T.codomain = Y) (hS' : S.domain = Z) where
  compositeApex : C
  leftLeg : compositeApex ⟶ Z
  rightLeg : compositeApex ⟶ Y
  pullbackSquare : IsPullback (S.rightLeg) (T.leftLeg)

structure SpanAdmissibleClass (C : Type u) [Category C] extends AdmissibleClass where
  span : SpanCategory C
  compositionClosed : Prop
  compositionWitness : compositionClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse