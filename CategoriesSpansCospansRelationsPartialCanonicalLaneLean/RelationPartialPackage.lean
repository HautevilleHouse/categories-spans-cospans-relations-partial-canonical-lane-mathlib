import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSpansCospansRelationsPartialCanonicalLaneLean.SpanCospanAdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure RelationPartialPackage where
  carrier : Type u
  relation : carrier → carrier → Prop
  reflexivity : ∀ x : carrier, relation x x
  transitivity : ∀ x y z : carrier, relation x y → relation y z → relation x z
  antisymmetry : ∀ x y : carrier, relation x y → relation y x → x = y

structure RelationPartialEvidence (R : RelationPartialPackage) where
  reflexivityClosed : R.reflexivity
  transitivityClosed : R.transitivity
  antisymmetryClosed : R.antisymmetry

def RelationPartialClosed (R : RelationPartialPackage) : Prop :=
  R.reflexivity ∧ R.transitivity ∧ R.antisymmetry

theorem relation_partial_closed_from_evidence (R : RelationPartialPackage)
    (E : RelationPartialEvidence R) : RelationPartialClosed R := by
  exact And.intro E.reflexivityClosed (And.intro E.transitivityClosed E.antisymmetryClosed)

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse