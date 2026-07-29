import CategoriesSpansCospansRelationsPartialCanonicalLaneLean.SpanStructure

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure PartialMapPackage where
  span : SpanPackage
  leftMonic : ∀ (x y : span.apex), span.leftArrow x = span.leftArrow y → x = y

structure PartialMapEvidence (P : PartialMapPackage) where
  leftMonicClosed : P.leftMonic

def PartialMapClosed (P : PartialMapPackage) : Prop :=
  P.leftMonic

theorem partial_map_closed_from_evidence (P : PartialMapPackage) (E : PartialMapEvidence P) : PartialMapClosed P := by
  exact E.leftMonicClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse