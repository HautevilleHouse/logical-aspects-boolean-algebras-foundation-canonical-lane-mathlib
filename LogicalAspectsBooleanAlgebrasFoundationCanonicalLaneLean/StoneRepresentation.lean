import canonicalLaneMathlib.BooleanAlgebraBasics

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure StoneRepresentationPackage (A : AdmittedObject) where
  dualSpace : Type u
  topology : TopologicalSpace dualSpace
  isStoneSpace : Prop
  representationMap : A.algebra.carrier → (dualSpace → Prop)
  representationIsIsomorphism : Prop
  compactOpenSets : Prop

def StoneRepresentationClosed {A : AdmittedObject} (S : StoneRepresentationPackage A) : Prop :=
  S.isStoneSpace ∧ S.representationIsIsomorphism ∧ S.compactOpenSets

structure StoneRepresentationEvidence {A : AdmittedObject} (S : StoneRepresentationPackage A) where
  isStoneSpaceClosed : S.isStoneSpace
  representationIsIsomorphismClosed : S.representationIsIsomorphism
  compactOpenSetsClosed : S.compactOpenSets

theorem stone_representation_closed_from_evidence {A : AdmittedObject} (S : StoneRepresentationPackage A) (E : StoneRepresentationEvidence S) :
    StoneRepresentationClosed S :=
  And.intro E.isStoneSpaceClosed (And.intro E.representationIsIsomorphismClosed E.compactOpenSetsClosed)

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
