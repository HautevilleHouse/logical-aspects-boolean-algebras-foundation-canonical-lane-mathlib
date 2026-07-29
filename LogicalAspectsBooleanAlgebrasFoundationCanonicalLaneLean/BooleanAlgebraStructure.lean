import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure BooleanAlgebraPackage where
  carrier : Type u
  top : carrier
  bot : carrier
  compl : carrier → carrier
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  meetCommutative : ∀ a b : carrier, meet a b = meet b a
  joinCommutative : ∀ a b : carrier, join a b = join b a
  meetAssociative : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinAssociative : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetAbsorbsJoin : ∀ a b : carrier, meet a (join a b) = a
  joinAbsorbsMeet : ∀ a b : carrier, join a (meet a b) = a
  meetDistributesJoin : ∀ a b c : carrier, meet a (join b c) = join (meet a b) (meet a c)
  joinDistributesMeet : ∀ a b c : carrier, join a (meet b c) = meet (join a b) (join a c)
  topMeet : ∀ a : carrier, meet a top = a
  botJoin : ∀ a : carrier, join a bot = a
  complementLaw1 : ∀ a : carrier, meet a (compl a) = bot
  complementLaw2 : ∀ a : carrier, join a (compl a) = top

structure BooleanAlgebraEvidence (B : BooleanAlgebraPackage) where
  meetCommutativeClosed : B.meetCommutative
  joinCommutativeClosed : B.joinCommutative
  meetAssociativeClosed : B.meetAssociative
  joinAssociativeClosed : B.joinAssociative
  meetAbsorbsJoinClosed : B.meetAbsorbsJoin
  joinAbsorbsMeetClosed : B.joinAbsorbsMeet
  meetDistributesJoinClosed : B.meetDistributesJoin
  joinDistributesMeetClosed : B.joinDistributesMeet
  topMeetClosed : B.topMeet
  botJoinClosed : B.botJoin
  complementLaw1Closed : B.complementLaw1
  complementLaw2Closed : B.complementLaw2

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  B.meetCommutative ∧ B.joinCommutative ∧
  B.meetAssociative ∧ B.joinAssociative ∧
  B.meetAbsorbsJoin ∧ B.joinAbsorbsMeet ∧
  B.meetDistributesJoin ∧ B.joinDistributesMeet ∧
  B.topMeet ∧ B.botJoin ∧
  B.complementLaw1 ∧ B.complementLaw2

theorem boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage) (E : BooleanAlgebraEvidence B) :
    BooleanAlgebraClosed B := by
  exact And.intro E.meetCommutativeClosed
    (And.intro E.joinCommutativeClosed
      (And.intro E.meetAssociativeClosed
        (And.intro E.joinAssociativeClosed
          (And.intro E.meetAbsorbsJoinClosed
            (And.intro E.joinAbsorbsMeetClosed
              (And.intro E.meetDistributesJoinClosed
                (And.intro E.joinDistributesMeetClosed
                  (And.intro E.topMeetClosed
                    (And.intro E.botJoinClosed
                      (And.intro E.complementLaw1Closed E.complementLaw2Closed))))))))))

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse