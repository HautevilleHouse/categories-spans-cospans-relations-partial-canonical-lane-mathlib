import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartialCanonicalLaneLean

structure PartialMorphism (A B : Type u) where
  dom : A → Prop
  codom : B → Prop
  map : { x : A // dom x } → { y : B // codom y }

def identityPartialMorphism (A : Type u) : PartialMorphism A A :=
  { dom := λ _ => True
    codom := λ _ => True
    map := λ x => x
  }

def composePartialMorphisms {A B C : Type u}
    (f : PartialMorphism A B) (g : PartialMorphism B C) : PartialMorphism A C :=
  { dom := λ a => f.dom a ∧ ∀ b, (b : { y : B // f.codom y }) = f.map ⟨a, sorry⟩ → g.dom b
    codom := λ c => g.codom c
    map := λ x => g.map ⟨(f.map ⟨x.1, x.2.1⟩).1, (f.map ⟨x.1, x.2.1⟩).2⟩
  }

structure PartialCategory where
  Obj : Type u
  Hom : Obj → Obj → Type u
  identity : (X : Obj) → Hom X X
  compose : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z

structure PartialAdmissibleClass extends AdmissibleClass where
  partialCat : PartialCategory
  closureUnderComposition : Prop
  closureWitness : closureUnderComposition

end CategoriesSpansCospansRelationsPartialCanonicalLaneLean
end HautevilleHouse