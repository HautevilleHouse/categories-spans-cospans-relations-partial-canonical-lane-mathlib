import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSpansCospansRelationsPartialCanonicalLaneLean.SpanCospanStructure

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure SpanCategoryMorphism where
  sourceObject : SpanCospanObject
  targetObject : SpanCospanObject
  spanMap : sourceObject.source → targetObject.source
  cospanMap : targetObject.target × targetObject.target → sourceObject.target × sourceObject.target
  commutativity : ∀ x : sourceObject.source, spanMap (sourceObject.cospan (sourceObject.span x)) = targetObject.cospan (targetObject.span (spanMap x))

structure SpanCategoryMorphismEvidence (f : SpanCategoryMorphism) where
  commutativityClosed : f.commutativity

def SpanCategoryMorphismClosed (f : SpanCategoryMorphism) : Prop :=
  f.commutativity

theorem span_category_morphism_closed_from_evidence (f : SpanCategoryMorphism)
    (E : SpanCategoryMorphismEvidence f) : SpanCategoryMorphismClosed f := by
  exact E.commutativityClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse