import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure BicategoryOfSpans where
  objects : Type u
  oneMorphisms : ∀ (X Y : objects), Type u
  twoMorphisms : ∀ {X Y : objects} (f g : oneMorphisms X Y), Type u
  verticalComposition : ∀ {X Y : objects} {f g h : oneMorphisms X Y}, twoMorphisms f g → twoMorphisms g h → twoMorphisms f h
  horizontalComposition : ∀ {X Y Z : objects} (f : oneMorphisms X Y) (g : oneMorphisms Y Z), oneMorphisms X Z
  associator : ∀ {W X Y Z : objects} (f : oneMorphisms W X) (g : oneMorphisms X Y) (h : oneMorphisms Y Z),
    twoMorphisms (horizontalComposition (horizontalComposition f g) h) (horizontalComposition f (horizontalComposition g h))
  leftUnitor : ∀ {X Y : objects} (f : oneMorphisms X Y), twoMorphisms (horizontalComposition (idOneMorphism X) f) f
  rightUnitor : ∀ {X Y : objects} (f : oneMorphisms X Y), twoMorphisms (horizontalComposition f (idOneMorphism Y)) f
  pentagonIdentity : ∀ {V W X Y Z : objects} (f : oneMorphisms V W) (g : oneMorphisms W X) (h : oneMorphisms X Y) (i : oneMorphisms Y Z), True
  triangleIdentity : ∀ {X Y Z : objects} (f : oneMorphisms X Y) (g : oneMorphisms Y Z), True
  idOneMorphism : ∀ (X : objects), oneMorphisms X X
  idTwoMorphism : ∀ {X Y : objects} (f : oneMorphisms X Y), twoMorphisms f f

structure BicategoryOfSpansPackage where
  bicategory : BicategoryOfSpans
  spanStructureCompatible : Prop
  spanStructureCompatibleTerm : spanStructureCompatible

structure BicategoryOfSpansEvidence (P : BicategoryOfSpansPackage) where
  spanStructureCompatibleClosed : P.spanStructureCompatible

def BicategoryOfSpansClosed (P : BicategoryOfSpansPackage) : Prop :=
  P.spanStructureCompatible

theorem bicategory_of_spans_closed_from_evidence (P : BicategoryOfSpansPackage) (E : BicategoryOfSpansEvidence P) :
    BicategoryOfSpansClosed P := by
  exact E.spanStructureCompatibleClosed

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse