import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSpansCospansRelationsPartial

-- Category structure
structure Category (Obj : Type u) (Hom : Obj → Obj → Type v) where
  id : ∀ X, Hom X X
  comp : ∀ {X Y Z}, Hom X Y → Hom Y Z → Hom X Z

-- Span structure
structure Span (C : Category Obj Hom) (A B : Obj) where
  apex : Obj
  left : Hom apex A
  right : Hom apex B

-- Cospan structure
structure Cospan (C : Category Obj Hom) (A B : Obj) where
  apex : Obj
  left : Hom A apex
  right : Hom B apex

-- Relation structure
structure Relation (X : Type u) where
  rel : X → X → Prop

-- Partial order structure
structure PartialOrder (X : Type u) where
  le : X → X → Prop
  refl : ∀ x, le x x
  trans : ∀ x y z, le x y → le y z → le x z
  antisymm : ∀ x y, le x y → le y x → x = y

-- Admitted object in this domain
structure AdmittedObject where
  cat : Category (Type u) (fun X Y => X → Y) -- simplified
  span : Span cat "unit" "unit" -- placeholder
  relation : Relation (Type u)
  partialOrder : PartialOrder (Type u)
  witness : Prop

end CategoriesSpansCospansRelationsPartial
end HautevilleHouse