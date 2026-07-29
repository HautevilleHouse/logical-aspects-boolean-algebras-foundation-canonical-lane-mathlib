import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure CompleteBooleanAlgebraPackage where
  carrier : Type u
  le : carrier -> carrier -> Prop
  sup : Set carrier -> carrier
  inf : Set carrier -> carrier
  distributivity : Prop
  distributivityTerm : distributivity

structure CompleteBooleanAlgebraEvidence (C : CompleteBooleanAlgebraPackage) where
  distributivityClosed : C.distributivity

def CompleteBooleanAlgebraClosed (C : CompleteBooleanAlgebraPackage) : Prop :=
  C.distributivity

theorem complete_boolean_algebra_closed_from_evidence (C : CompleteBooleanAlgebraPackage)
    (E : CompleteBooleanAlgebraEvidence C) : CompleteBooleanAlgebraClosed C := by
  exact E.distributivityClosed

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse