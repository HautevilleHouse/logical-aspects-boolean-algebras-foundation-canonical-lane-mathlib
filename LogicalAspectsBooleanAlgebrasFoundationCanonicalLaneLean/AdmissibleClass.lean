import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure BooleanAlgebraObject where
  carrier : Type
  top : carrier
  bot : carrier
  complement : carrier → carrier
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  top_bot_axioms : (∀ x : carrier, meet x top = x) ∧ (∀ x : carrier, join x bot = x)
  complement_axioms : (∀ x : carrier, meet x (complement x) = bot) ∧ (∀ x : carrier, join x (complement x) = top)
  distributive_axioms : (∀ x y z : carrier, meet x (join y z) = join (meet x y) (meet x z)) ∧ (∀ x y z : carrier, join x (meet y z) = meet (join x y) (join x z))

structure AdmittedObject where
  algebra : BooleanAlgebraObject
  isComplete : Prop
  isAtomistic : Prop
  conclusion : conclusion

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
