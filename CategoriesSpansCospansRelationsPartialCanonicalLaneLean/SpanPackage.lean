import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure SpanPackage where
  apex : Type
  leftObject : Type
  rightObject : Type
  leftLeg : apex → leftObject
  rightLeg : apex → rightObject
  universalProperty : Prop
  evidence : universalProperty

structure SpanEvidence (S : SpanPackage) where
  universalClosed : S.universalProperty

def SpanClosed (S : SpanPackage) : Prop :=
  S.universalProperty

theorem span_closed_from_evidence (S : SpanPackage) (E : SpanEvidence S) :
    SpanClosed S := by
  exact E.universalClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse