import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure BooleanAlgebraCarrier where
  carrier : Type
  top : carrier
  bot : carrier
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  complement : carrier → carrier

structure BooleanAlgebraObject where
  algebra : BooleanAlgebraCarrier
  axiomsSatisfied : Prop
  conclusion : BooleanAlgebraClosed algebra

def BooleanAlgebraClosed (B : BooleanAlgebraCarrier) : Prop :=
  B.axiomsSatisfied

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse