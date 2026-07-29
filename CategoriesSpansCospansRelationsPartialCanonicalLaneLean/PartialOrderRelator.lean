import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartial

structure RelatorPackage (R : Relation (Type u)) (P : PartialOrder (Type u)) where
  monotonicity : Prop
  closure : Prop

def RelatorClosed (R : RelatorPackage) : Prop :=
  R.monotonicity ∧ R.closure

end CategoriesSpansCospansRelationsPartial
end HautevilleHouse