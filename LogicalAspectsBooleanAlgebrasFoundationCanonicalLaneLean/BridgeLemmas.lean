import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BooleanAlgebraWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
