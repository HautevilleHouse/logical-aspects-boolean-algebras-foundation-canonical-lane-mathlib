import canonicalLaneMathlib.StoneRepresentation

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure DualityPackage (A : AdmittedObject) (S : StoneRepresentationPackage A) where
  dualEquivalence : Prop
  categoricalDuality : Prop
  homFunctor : Type u → Type v
  dualFunctor : Type v → Type u
  adjunction : Prop

def DualityClosed {A : AdmittedObject} {S : StoneRepresentationPackage A} (D : DualityPackage A S) : Prop :=
  D.dualEquivalence ∧ D.categoricalDuality ∧ D.adjunction

structure DualityEvidence {A : AdmittedObject} {S : StoneRepresentationPackage A} (D : DualityPackage A S) where
  dualEquivalenceClosed : D.dualEquivalence
  categoricalDualityClosed : D.categoricalDuality
  adjunctionClosed : D.adjunction

theorem duality_closed_from_evidence {A : AdmittedObject} {S : StoneRepresentationPackage A} (D : DualityPackage A S) (E : DualityEvidence D) :
    DualityClosed D :=
  And.intro E.dualEquivalenceClosed (And.intro E.categoricalDualityClosed E.adjunctionClosed)

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
