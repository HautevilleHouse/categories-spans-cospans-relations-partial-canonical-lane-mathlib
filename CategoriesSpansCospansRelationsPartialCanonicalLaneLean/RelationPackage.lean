import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure RelationPackage where
  carrier : Type
  relation : carrier → carrier → Prop
  reflexivity : ∀ x : carrier, relation x x
  symmetry : ∀ x y : carrier, relation x y → relation y x
  transitivity : ∀ x y z : carrier, relation x y → relation y z → relation x z
  evidence : reflexivity ∧ symmetry ∧ transitivity

structure RelationEvidence (R : RelationPackage) where
  reflexivityClosed : R.reflexivity
  symmetryClosed : R.symmetry
  transitivityClosed : R.transitivity

def RelationClosed (R : RelationPackage) : Prop :=
  R.reflexivity ∧ R.symmetry ∧ R.transitivity

theorem relation_closed_from_evidence (R : RelationPackage) (E : RelationEvidence R) :
    RelationClosed R := by
  exact And.intro E.reflexivityClosed (And.intro E.symmetryClosed E.transitivityClosed)

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse