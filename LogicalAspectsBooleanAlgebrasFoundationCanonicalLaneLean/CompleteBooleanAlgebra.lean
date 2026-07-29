import canonicalLaneMathlib.BooleanAlgebraBasics

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure CompleteBooleanAlgebraPackage (A : AdmittedObject) where
  isComplete : Prop
  arbitraryMeets : (A.algebra.carrier → Prop) → A.algebra.carrier
  arbitraryJoins : (A.algebra.carrier → Prop) → A.algebra.carrier
  meetsSatisfy : Prop
  joinsSatisfy : Prop

def CompleteBooleanAlgebraClosed {A : AdmittedObject} (C : CompleteBooleanAlgebraPackage A) : Prop :=
  C.isComplete ∧ C.meetsSatisfy ∧ C.joinsSatisfy

structure CompleteBooleanAlgebraEvidence {A : AdmittedObject} (C : CompleteBooleanAlgebraPackage A) where
  isCompleteClosed : C.isComplete
  meetsSatisfyClosed : C.meetsSatisfy
  joinsSatisfyClosed : C.joinsSatisfy

theorem complete_boolean_algebra_closed_from_evidence {A : AdmittedObject} (C : CompleteBooleanAlgebraPackage A) (E : CompleteBooleanAlgebraEvidence C) :
    CompleteBooleanAlgebraClosed C :=
  And.intro E.isCompleteClosed (And.intro E.meetsSatisfyClosed E.joinsSatisfyClosed)

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
