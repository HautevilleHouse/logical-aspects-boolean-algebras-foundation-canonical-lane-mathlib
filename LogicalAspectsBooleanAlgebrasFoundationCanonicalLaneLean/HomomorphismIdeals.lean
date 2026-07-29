import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsBooleanAlgebrasFoundation.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundation

structure BooleanAlgebraHom {B1 B2 : BooleanAlgebraPackage} where
  toFun : B1.carrier → B2.carrier
  preservesTop : toFun B1.top = B2.top
  preservesBot : toFun B1.bot = B2.bot
  preservesComplement : ∀ a : B1.carrier, toFun (B1.complement a) = B2.complement (toFun a)
  preservesMeet : ∀ a b : B1.carrier, toFun (B1.meet a b) = B2.meet (toFun a) (toFun b)
  preservesJoin : ∀ a b : B1.carrier, toFun (B1.join a b) = B2.join (toFun a) (toFun b)

structure Ideal (B : BooleanAlgebraPackage) where
  subset : Set B.carrier
  containsBot : B.bot ∈ subset
  closedUnderMeet : ∀ a b : B.carrier, a ∈ subset → b ∈ subset → B.meet a b ∈ subset
  closedUnderJoinUpwards : ∀ a b : B.carrier, a ∈ subset → B.join a b ∈ subset

def IdealClosed {B : BooleanAlgebraPackage} (I : Ideal B) : Prop :=
  I.containsBot ∧ I.closedUnderMeet ∧ I.closedUnderJoinUpwards

structure MaximalIdeal {B : BooleanAlgebraPackage} (I : Ideal B) where
  proper : I.subset ≠ Set.univ
  maximalCondition : ∀ (J : Ideal B), I.subset ⊆ J.subset → J.subset = I.subset ∨ J.subset = Set.univ

theorem maximal_ideal_contains_complement_iff {B : BooleanAlgebraPackage} (I : Ideal B) (I_max : MaximalIdeal I) (a : B.carrier) :
    B.complement a ∈ I.subset ↔ a ∉ I.subset := by
  constructor
  · intro h
    intro ha
    have : B.meet a (B.complement a) ∈ I.subset := I.closedUnderMeet a (B.complement a) ha h
    have : B.bot ∈ I.subset := by simpa [B.complementMeet] using this
    have : I.subset = Set.univ := I_max.maximalCondition (fun x hx => ?_) -- trivial
    sorry
  · sorry

end LogicalAspectsBooleanAlgebrasFoundation
end HautevilleHouse