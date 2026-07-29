import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure RelationPartialMapPackage where
  relationalCompositionAssociative : Prop
  identityRelationExists : Prop
  partialMapCompositionAssociative : Prop
  identityPartialMapExists : Prop
  relationalCompositionAssociativeClosed : relationalCompositionAssociative
  identityRelationExistsClosed : identityRelationExists
  partialMapCompositionAssociativeClosed : partialMapCompositionAssociative
  identityPartialMapExistsClosed : identityPartialMapExists

structure RelationPartialMapEvidence (P : RelationPartialMapPackage) where
  relationalCompositionAssociativeClosed : P.relationalCompositionAssociative
  identityRelationExistsClosed : P.identityRelationExists
  partialMapCompositionAssociativeClosed : P.partialMapCompositionAssociative
  identityPartialMapExistsClosed : P.identityPartialMapExists

def RelationPartialMapClosed (P : RelationPartialMapPackage) : Prop :=
  P.relationalCompositionAssociative ∧ P.identityRelationExists ∧
  P.partialMapCompositionAssociative ∧ P.identityPartialMapExists

theorem relation_partial_map_closed_from_evidence (P : RelationPartialMapPackage)
    (E : RelationPartialMapEvidence P) : RelationPartialMapClosed P := by
  exact And.intro E.relationalCompositionAssociativeClosed
    (And.intro E.identityRelationExistsClosed
      (And.intro E.partialMapCompositionAssociativeClosed
        E.identityPartialMapExistsClosed))

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse