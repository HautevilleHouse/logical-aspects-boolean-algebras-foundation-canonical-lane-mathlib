import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean

structure BooleanAlgebraMorphism (B1 B2 : BooleanAlgebraPackage) where
  map : B1.carrier → B2.carrier
  preservesTop : map B1.top = B2.top
  preservesBot : map B1.bot = B2.bot
  preservesCompl : ∀ a : B1.carrier, map (B1.compl a) = B2.compl (map a)
  preservesMeet : ∀ a b : B1.carrier, map (B1.meet a b) = B2.meet (map a) (map b)
  preservesJoin : ∀ a b : B1.carrier, map (B1.join a b) = B2.join (map a) (map b)

structure BooleanAlgebraMorphismEvidence {B1 B2 : BooleanAlgebraPackage} (f : BooleanAlgebraMorphism B1 B2) where
  preservesTopClosed : f.preservesTop
  preservesBotClosed : f.preservesBot
  preservesComplClosed : f.preservesCompl
  preservesMeetClosed : f.preservesMeet
  preservesJoinClosed : f.preservesJoin

def BooleanAlgebraMorphismClosed {B1 B2 : BooleanAlgebraPackage} (f : BooleanAlgebraMorphism B1 B2) : Prop :=
  f.preservesTop ∧ f.preservesBot ∧ f.preservesCompl ∧ f.preservesMeet ∧ f.preservesJoin

theorem boolean_algebra_morphism_closed_from_evidence {B1 B2 : BooleanAlgebraPackage} (f : BooleanAlgebraMorphism B1 B2) (E : BooleanAlgebraMorphismEvidence f) :
    BooleanAlgebraMorphismClosed f := by
  exact And.intro E.preservesTopClosed
    (And.intro E.preservesBotClosed
      (And.intro E.preservesComplClosed
        (And.intro E.preservesMeetClosed E.preservesJoinClosed)))

def BooleanAlgebraIsomorphism (B1 B2 : BooleanAlgebraPackage) : Prop :=
  ∃ (f : BooleanAlgebraMorphism B1 B2) (g : BooleanAlgebraMorphism B2 B1),
    (∀ a : B1.carrier, g.map (f.map a) = a) ∧ (∀ b : B2.carrier, f.map (g.map b) = b)

theorem isomorphism_is_bijection (B1 B2 : BooleanAlgebraPackage) (h : BooleanAlgebraIsomorphism B1 B2) :
    ∃ (f : B1.carrier → B2.carrier), Function.Bijective f := by
  rcases h with ⟨f, g, h1, h2⟩
  refine ⟨f.map, ?_, ?_⟩
  · intro a1 a2 h
    apply (Function.LeftInverse.injective (fun a => ?_) a1 a2 h)
    exact h1 a
  · intro b
    refine ⟨g.map b, ?_⟩
    exact h2 b

end LogicalAspectsBooleanAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse