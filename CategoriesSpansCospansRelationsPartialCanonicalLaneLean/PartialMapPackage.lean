import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure PartialMapPackage where
  source : Type
  target : Type
  domain : source → Prop
  mapping : ∀ x : source, domain x → target
  domainDecidable : DecidablePred domain
  mappingDefined : Prop
  evidence : mappingDefined

structure PartialMapEvidence (P : PartialMapPackage) where
  mappingDefinedClosed : P.mappingDefined

def PartialMapClosed (P : PartialMapPackage) : Prop :=
  P.mappingDefined

theorem partial_map_closed_from_evidence (P : PartialMapPackage) (E : PartialMapEvidence P) :
    PartialMapClosed P := by
  exact E.mappingDefinedClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse