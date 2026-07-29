import CategoriesSpansCospansRelationsPartialCanonicalLaneLean.SpanCospanAdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SpanClosed A.object.span ∧ CospanClosed A.object.cospan

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.compatibility

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse