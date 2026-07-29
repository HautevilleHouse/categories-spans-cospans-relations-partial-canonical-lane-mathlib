import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure SpanCospanObject where
  source : Type u
  target : Type v
  span : source → target × target
  cospan : target × target → source
  idempotent : ∀ x : source, cospan (span x) = x

structure AdmissibleSpanClass where
  object : SpanCospanObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleSpanClass) : Prop :=
  SpanCospanWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse