import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure BooleanAlgebraPackage where
  carrier : Type u
  bot top : carrier
  complement : carrier → carrier
  meet join : carrier → carrier → carrier
  axiomsSatisfied : Prop
  axiomsSatisfiedTerm : axiomsSatisfied

structure BooleanAlgebraEvidence (B : BooleanAlgebraPackage) where
  axiomsSatisfiedClosed : B.axiomsSatisfied

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  B.axiomsSatisfied

theorem boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage)
    (E : BooleanAlgebraEvidence B) : BooleanAlgebraClosed B := by
  exact E.axiomsSatisfiedClosed

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
