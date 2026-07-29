import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundation

structure BooleanAlgebraPackage where
  carrier : Type u
  top : carrier
  bot : carrier
  complement : carrier → carrier
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  meetAssoc : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinAssoc : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetComm : ∀ a b : carrier, meet a b = meet b a
  joinComm : ∀ a b : carrier, join a b = join b a
  absorbMeetJoin : ∀ a b : carrier, meet a (join a b) = a
  absorbJoinMeet : ∀ a b : carrier, join a (meet a b) = a
  meetDistribJoin : ∀ a b c : carrier, meet a (join b c) = join (meet a b) (meet a c)
  joinDistribMeet : ∀ a b c : carrier, join a (meet b c) = meet (join a b) (join a c)
  complementMeet : ∀ a : carrier, meet a (complement a) = bot
  complementJoin : ∀ a : carrier, join a (complement a) = top

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  B.meetAssoc True ∧ B.joinAssoc True ∧ B.meetComm True ∧ B.joinComm True ∧
  B.absorbMeetJoin True ∧ B.absorbJoinMeet True ∧ B.meetDistribJoin True ∧
  B.joinDistribMeet True ∧ B.complementMeet True ∧ B.complementJoin True

end LogicalAspectsBooleanAlgebrasFoundation
end HautevilleHouse