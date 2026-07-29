import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure PartialMapPackage where
  source : Type u
  target : Type v
  definedness : source → Prop
  mapping : ∀ x : source, definedness x → target
  compositionClosed : Prop
  identityDefined : Prop

structure PartialMapEvidence (P : PartialMapPackage) where
  compositionClosedClosed : P.compositionClosed
  identityDefinedClosed : P.identityDefined

def PartialMapClosed (P : PartialMapPackage) : Prop :=
  P.compositionClosed ∧ P.identityDefined

theorem partial_map_closed_from_evidence (P : PartialMapPackage) (E : PartialMapEvidence P) :
    PartialMapClosed P := by
  exact And.intro E.compositionClosedClosed E.identityDefinedClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse