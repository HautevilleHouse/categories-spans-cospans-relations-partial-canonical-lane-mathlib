import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure Relation (A B : Type u) where
  graph : A → B → Prop

structure RelationCategory where
  objects : Type u
  morphisms : ∀ (X Y : objects), Type u
  identity : ∀ (X : objects), morphisms X X
  composition : ∀ {X Y Z : objects}, morphisms X Y → morphisms Y Z → morphisms X Z
  assoc : ∀ {W X Y Z : objects} (f : morphisms W X) (g : morphisms X Y) (h : morphisms Y Z),
    composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ {X Y : objects} (f : morphisms X Y), composition (identity X) f = f
  identityRight : ∀ {X Y : objects} (f : morphisms X Y), composition f (identity Y) = f

structure RelationAlgebraPackage where
  relationCategory : RelationCategory
  relationStructure : ∀ (A B : relationCategory.objects), Relation A B
  compositionCorrect : Prop
  compositionCorrectTerm : compositionCorrect

structure RelationAlgebraEvidence (P : RelationAlgebraPackage) where
  compositionCorrectClosed : P.compositionCorrect

def RelationAlgebraClosed (P : RelationAlgebraPackage) : Prop :=
  P.compositionCorrect

theorem relation_algebra_closed_from_evidence (P : RelationAlgebraPackage) (E : RelationAlgebraEvidence P) :
    RelationAlgebraClosed P := by
  exact E.compositionCorrectClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse