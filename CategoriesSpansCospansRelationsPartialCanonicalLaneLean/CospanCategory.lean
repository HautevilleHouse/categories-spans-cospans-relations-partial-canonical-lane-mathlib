import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure CospanCategory (C : Type u) [Category C] where
  nadir : C
  leftLeg : domain ⟶ nadir
  rightLeg : codomain ⟶ nadir
  domain : C
  codomain : C

structure CospanComposition {C : Type u} [Category C] {X Y Z : C}
    (S : CospanCategory C) (T : CospanCategory C)
    (hS : S.codomain = X) (hT : T.domain = X) (hT' : T.codomain = Y) (hS' : S.domain = Z) where
  compositeNadir : C
  leftLeg : Z ⟶ compositeNadir
  rightLeg : Y ⟶ compositeNadir
  pushoutSquare : IsPushout (S.rightLeg) (T.leftLeg)

structure CospanAdmissibleClass (C : Type u) [Category C] extends AdmissibleClass where
  cospan : CospanCategory C
  compositionClosed : Prop
  compositionWitness : compositionClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse