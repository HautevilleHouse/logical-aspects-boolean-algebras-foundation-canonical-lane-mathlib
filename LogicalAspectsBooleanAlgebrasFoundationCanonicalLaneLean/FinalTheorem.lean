import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

def ConstrainedBooleanAlgebrasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_boolean_algebras_endgame (A : AdmissibleClass) :
    ConstrainedBooleanAlgebrasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
