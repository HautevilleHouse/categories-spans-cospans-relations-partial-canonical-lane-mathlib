import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSpansCospansRelationsPartialCanonicalLaneLean.SpanCospanAdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

def bridgeClosed (A : AdmissibleSpanClass) : Prop :=
  SpanCospanWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleSpanClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse