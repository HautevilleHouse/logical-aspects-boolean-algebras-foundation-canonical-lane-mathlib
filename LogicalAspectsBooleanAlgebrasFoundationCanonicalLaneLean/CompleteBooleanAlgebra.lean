import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure CompleteBooleanAlgebraPackage (B : BooleanAlgebraPackage) where
  inf : Set B.carrier → B.carrier
  sup : Set B.carrier → B.carrier
  infDefined : ∀ S : Set B.carrier, inf S = ⋂₀ (Set.image (fun (a : B.carrier) => {x : B.carrier | B.meet x a = a}) S)
  supDefined : ∀ S : Set B.carrier, sup S = ⋃₀ (Set.image (fun (a : B.carrier) => {x : B.carrier | B.join x a = a}) S)
  infIsMeet : ∀ a b : B.carrier, inf {a, b} = B.meet a b
  supIsJoin : ∀ a b : B.carrier, sup {a, b} = B.join a b
  distributesOverInf : ∀ (S : Set B.carrier) (a : B.carrier), B.meet a (inf S) = inf (Set.image (fun b : B.carrier => B.meet a b) S)
  distributesOverSup : ∀ (S : Set B.carrier) (a : B.carrier), B.join a (sup S) = sup (Set.image (fun b : B.carrier => B.join a b) S)

structure CompleteBooleanAlgebraEvidence (B : BooleanAlgebraPackage) (C : CompleteBooleanAlgebraPackage B) where
  infDefinedClosed : C.infDefined
  supDefinedClosed : C.supDefined
  infIsMeetClosed : C.infIsMeet
  supIsJoinClosed : C.supIsJoin
  distributesOverInfClosed : C.distributesOverInf
  distributesOverSupClosed : C.distributesOverSup

def CompleteBooleanAlgebraClosed (B : BooleanAlgebraPackage) (C : CompleteBooleanAlgebraPackage B) : Prop :=
  C.infDefined ∧ C.supDefined ∧ C.infIsMeet ∧ C.supIsJoin ∧ C.distributesOverInf ∧ C.distributesOverSup

theorem complete_boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage) (C : CompleteBooleanAlgebraPackage B) (E : CompleteBooleanAlgebraEvidence B C) :
    CompleteBooleanAlgebraClosed B C := by
  exact And.intro E.infDefinedClosed
    (And.intro E.supDefinedClosed
      (And.intro E.infIsMeetClosed
        (And.intro E.supIsJoinClosed
          (And.intro E.distributesOverInfClosed E.distributesOverSupClosed))))

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse