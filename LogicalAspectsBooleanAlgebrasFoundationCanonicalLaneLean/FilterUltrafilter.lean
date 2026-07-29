import HautevilleHouse.LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean.BooleanAlgebraStructure

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure FilterPackage where
  carrier : Type u
  order : carrier → carrier → Prop
  filter : Set carrier
  upwardClosed : Prop
  finiteMeetClosed : Prop

structure FilterEvidence (F : FilterPackage) where
  upwardClosedClosed : F.upwardClosed
  finiteMeetClosedClosed : F.finiteMeetClosed

def FilterClosed (F : FilterPackage) : Prop :=
  F.upwardClosed ∧ F.finiteMeetClosed

theorem filter_closed_from_evidence (F : FilterPackage) (E : FilterEvidence F) : FilterClosed F := by
  exact And.intro E.upwardClosedClosed E.finiteMeetClosedClosed

structure UltrafilterPackage extends FilterPackage where
  maximal : Prop
  maximalTerm : maximal

structure UltrafilterEvidence (U : UltrafilterPackage) where
  filterClosed : FilterClosed U.toFilterPackage
  maximalClosed : U.maximal

def UltrafilterClosed (U : UltrafilterPackage) : Prop :=
  FilterClosed U.toFilterPackage ∧ U.maximal

theorem ultrafilter_closed_from_evidence (U : UltrafilterPackage) (E : UltrafilterEvidence U) : UltrafilterClosed U := by
  exact And.intro E.filterClosed E.maximalClosed

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
