import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure BooleanAlgebraAdmittedObject where
  carrier : Type
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  complement : carrier → carrier
  bottom : carrier
  top : carrier
  booleanAlgebraAxioms : Prop
  conclusion : booleanAlgebraAxioms

def BooleanAlgebraWitnessClosed (O : BooleanAlgebraAdmittedObject) : Prop :=
  O.booleanAlgebraAxioms

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
