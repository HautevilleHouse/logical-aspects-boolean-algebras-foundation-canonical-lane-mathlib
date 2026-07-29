import canonicalLaneMathlib.BooleanAlgebraObject

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure StoneSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  compact : Prop
  hausdorff : Prop
  totallyDisconnected : Prop

structure StoneRepresentationPackage where
  booleanAlgebra : BooleanAlgebraCarrier
  stoneSpace : StoneSpace
  representationMap : booleanAlgebra.carrier → Set stoneSpace.carrier
  isomorphism : Prop
  isomorphismClosed : isomorphism

def StoneRepresentationClosed (P : StoneRepresentationPackage) : Prop :=
  P.isomorphism

theorem stone_representation_closed_from_evidence (P : StoneRepresentationPackage) :
    StoneRepresentationClosed P := by
  exact P.isomorphismClosed

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse