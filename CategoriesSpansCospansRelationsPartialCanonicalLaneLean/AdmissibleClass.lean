import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure AdmissibleClass where
  category : Type u
  [catInstance : Category category]
  object : category
  spanClosed : Prop
  cospanClosed : Prop
  relationClosed : Prop
  partialOrderClosed : Prop

def bridgeClosed (A : AdmissibleClass) : Prop := A.spanClosed ∧ A.cospanClosed
def gateClosed (A : AdmissibleClass) : Prop := A.relationClosed ∨ A.partialOrderClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact And.intro A.spanClosed A.cospanClosed

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact Or.inl A.relationClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse