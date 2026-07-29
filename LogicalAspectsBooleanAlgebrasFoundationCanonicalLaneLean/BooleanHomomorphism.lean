import HautevilleHouse.LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure BooleanHomomorphismPackage {A B : BooleanAlgebraPackage} where
  homFun : A.carrier → B.carrier
  preservesMeet : Prop
  preservesJoin : Prop
  preservesComplement : Prop
  preservesBot : Prop
  preservesTop : Prop
  preservesMeetTerm : preservesMeet
  preservesJoinTerm : preservesJoin
  preservesComplementTerm : preservesComplement
  preservesBotTerm : preservesBot
  preservesTopTerm : preservesTop

structure BooleanHomomorphismEvidence {A B : BooleanAlgebraPackage} (H : BooleanHomomorphismPackage A B) where
  preservesMeetClosed : H.preservesMeet
  preservesJoinClosed : H.preservesJoin
  preservesComplementClosed : H.preservesComplement
  preservesBotClosed : H.preservesBot
  preservesTopClosed : H.preservesTop

def BooleanHomomorphismClosed {A B : BooleanAlgebraPackage} (H : BooleanHomomorphismPackage A B) : Prop :=
  H.preservesMeet ∧ H.preservesJoin ∧ H.preservesComplement ∧ H.preservesBot ∧ H.preservesTop

theorem boolean_homomorphism_closed_from_evidence {A B : BooleanAlgebraPackage}
    (H : BooleanHomomorphismPackage A B) (E : BooleanHomomorphismEvidence H) :
    BooleanHomomorphismClosed H := by
  exact And.intro E.preservesMeetClosed
    (And.intro E.preservesJoinClosed
      (And.intro E.preservesComplementClosed
        (And.intro E.preservesBotClosed E.preservesTopClosed)))

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
