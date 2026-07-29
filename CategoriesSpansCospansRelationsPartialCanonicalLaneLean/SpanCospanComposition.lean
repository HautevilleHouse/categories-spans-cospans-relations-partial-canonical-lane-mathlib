import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartial

structure SpanCompositionPackage (S1 S2 : Span (Category Type (fun X Y => X → Y)) A B) where
  compositionDefined : Prop
  apexProperty : Prop

def SpanCompositionClosed (P : SpanCompositionPackage) : Prop :=
  P.compositionDefined ∧ P.apexProperty

end CategoriesSpansCospansRelationsPartial
end HautevilleHouse