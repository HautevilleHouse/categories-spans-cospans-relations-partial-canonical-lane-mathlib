import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSpansCospansRelationsPartialCanonicalLaneLean.SpanCospanAdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure SpanCospanStructure where
  spanObject : SpanCospanObject
  cospanObject : SpanCospanObject
  compositionLaw : Prop
  identityLaw : Prop
  associativity : Prop

structure SpanCospanStructureEvidence (S : SpanCospanStructure) where
  compositionLawClosed : S.compositionLaw
  identityLawClosed : S.identityLaw
  associativityClosed : S.associativity

def SpanCospanStructureClosed (S : SpanCospanStructure) : Prop :=
  S.compositionLaw ∧ S.identityLaw ∧ S.associativity

theorem span_cospan_structure_closed_from_evidence (S : SpanCospanStructure)
    (E : SpanCospanStructureEvidence S) : SpanCospanStructureClosed S := by
  exact And.intro E.compositionLawClosed (And.intro E.identityLawClosed E.associativityClosed)

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse