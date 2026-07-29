import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSpansCospansRelationsPartialCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

def gateClosed (A : AdmissibleSpanClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleSpanClass) :
    gateClosed A := by
  exact A.gateWitness

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse