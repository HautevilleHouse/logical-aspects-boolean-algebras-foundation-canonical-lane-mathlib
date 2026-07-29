import HautevilleHouse.LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure StoneRepresentationPackage {B : BooleanAlgebraPackage} where
  spectrum : Type u
  topology : TopologicalSpace spectrum
  compactHausdorffTotallyDisconnected : Prop
  isomorphismToClopenSets : Prop

structure StoneRepresentationEvidence {B : BooleanAlgebraPackage} (S : StoneRepresentationPackage B) where
  compactHausdorffTotallyDisconnectedClosed : S.compactHausdorffTotallyDisconnected
  isomorphismToClopenSetsClosed : S.isomorphismToClopenSets

def StoneRepresentationClosed {B : BooleanAlgebraPackage}
    (S : StoneRepresentationPackage B) : Prop :=
  S.compactHausdorffTotallyDisconnected ∧ S.isomorphismToClopenSets

theorem stone_representation_closed_from_evidence {B : BooleanAlgebraPackage}
    (S : StoneRepresentationPackage B) (E : StoneRepresentationEvidence S) :
    StoneRepresentationClosed S := by
  exact And.intro E.compactHausdorffTotallyDisconnectedClosed E.isomorphismToClopenSetsClosed

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
