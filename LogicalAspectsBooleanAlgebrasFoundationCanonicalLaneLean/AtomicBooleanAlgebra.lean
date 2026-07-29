import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure AtomicBooleanAlgebraPackage where
  carrier : Type u
  top : carrier
  bot : carrier
  complement : carrier -> carrier
  meet : carrier -> carrier -> carrier
  join : carrier -> carrier -> carrier
  atoms : Set carrier
  atomicDecomposition : Prop
  atomicDecompositionTerm : atomicDecomposition

structure AtomicBooleanAlgebraEvidence (A : AtomicBooleanAlgebraPackage) where
  atomicDecompositionClosed : A.atomicDecomposition

def AtomicBooleanAlgebraClosed (A : AtomicBooleanAlgebraPackage) : Prop :=
  A.atomicDecomposition

theorem atomic_boolean_algebra_closed_from_evidence (A : AtomicBooleanAlgebraPackage)
    (E : AtomicBooleanAlgebraEvidence A) : AtomicBooleanAlgebraClosed A := by
  exact E.atomicDecompositionClosed

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse