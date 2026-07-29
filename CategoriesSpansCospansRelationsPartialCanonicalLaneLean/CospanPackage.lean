import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure CospanPackage where
  pushoutCocone : Type
  leftLeg : Type
  rightLeg : Type
  universalProperty : Prop
  evidence : universalProperty

structure CospanEvidence (C : CospanPackage) where
  universalClosed : C.universalProperty

def CospanClosed (C : CospanPackage) : Prop :=
  C.universalProperty

theorem cospan_closed_from_evidence (C : CospanPackage) (E : CospanEvidence C) :
    CospanClosed C := by
  exact E.universalClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse