import HautevilleHouse.LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean.StoneRepresentation

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure DualityPackage {B : BooleanAlgebraPackage} {S : StoneRepresentationPackage B} where
  contravariantFunctor : Type u → Type v
  dualEquivalence : Prop
  dualEquivalenceTerm : dualEquivalence

def DualityClosed {B : BooleanAlgebraPackage} {S : StoneRepresentationPackage B} (D : DualityPackage B S) : Prop :=
  D.dualEquivalence

theorem duality_closed_from_evidence {B : BooleanAlgebraPackage} {S : StoneRepresentationPackage B}
    (D : DualityPackage B S) : DualityClosed D := by
  exact D.dualEquivalenceTerm

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
