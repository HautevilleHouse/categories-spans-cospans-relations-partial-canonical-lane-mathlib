import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure PartialOrderCategory (X : Type u) where
  le : X → X → Prop
  le_refl : ∀ a, le a a
  le_trans : ∀ a b c, le a b → le b c → le a c
  le_antisymm : ∀ a b, le a b → le b a → a = b

def posetCategory (X : Type u) (po : PartialOrderCategory X) : Category X :=
  {
    Hom := λ a b => po.le a b
    id := λ a => po.le_refl a
    comp := λ f g => po.le_trans _ _ _ f g
    id_comp := λ _ _ f => by
      ext
      exact f
    comp_id := λ _ _ f => by
      ext
      exact f
    assoc := λ _ _ _ _ f g h => by
      ext
      apply po.le_antisymm
      · apply po.le_trans _ _ _ (po.le_trans _ _ _ f g) h
      · apply po.le_trans _ _ _ f (po.le_trans _ _ _ g h)
  }

theorem posetHomSet (X : Type u) (po : PartialOrderCategory X) (a b : X) : (a ⟶ b) ≃ po.le a b :=
  {
    toFun := λ f => f
    invFun := λ h => h
    left_inv := λ f => rfl
    right_inv := λ h => rfl
  }

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse