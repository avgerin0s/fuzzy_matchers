require "fuzzy_matcher"

describe FuzzyMatcher do
  describe "self.equals?" do
    context "when checking for objects from different classes" do
      let(:obj1) { { a: 1} }
      let(:obj2) { "Skroutz" }

      it "returns false" do
        FuzzyMatcher.equals?(obj1, obj2).should eq(false)
      end
    end

    context "when checking for strings" do
      context "that are equal" do
        let(:string1) { "Skroutz" }
        let(:string2) { "Skroutz" }

        it "returns true" do
          FuzzyMatcher.equals?(string1, string2).should eq(true)
        end
      end

      context "that are different" do
        let(:string1) { "Skroutz" }
        let(:string2) { "Alve" }

        it "returns false" do
          FuzzyMatcher.equals?(string1, string2).should eq(false)
        end
      end
    end

    context "when checking for numbers" do
      context "that are equal" do
        let(:num1) { 42 }
        let(:num2) { 42 }

        it "returns true" do
          FuzzyMatcher.equals?(num1, num2).should eq(true)
        end

        context "but the one is Fixnum and the other Float" do
          let(:num1) { 1 }
          let(:num2) { 1.0 }

          it "returns true" do
            FuzzyMatcher.equals?(num1, num2).should eq(true)
          end
        end
      end

      context "that are not equal" do
        let(:num1) { 42 }
        let(:num2) { 4242 }

        it "returns false" do
          FuzzyMatcher.equals?(num1, num2).should eq(false)
        end
      end
    end

    context "when checking for arrays" do
      context "that are equal" do
        context "and in order" do
          let(:array1) { [1, 2] }
          let(:array2) { [1, 2] }

          it "returns true" do
            FuzzyMatcher.equals?(array1, array2).should eq(true)
          end
        end

        context "but not in order" do
          let(:array1) { [1, 2] }
          let(:array2) { [2, 1] }

          it "returns true" do
            FuzzyMatcher.equals?(array1, array2).should eq(true)
          end
        end

        context "that are not equal" do
          let(:array1) { [1, 1, 2] }
          let(:array2) { [1, 2] }

          it "returns false" do
            FuzzyMatcher.equals?(array1, array2).should eq(false)
          end
        end
      end
    end

    context "when checking for hashes" do
      context "that are equal" do
        let(:hash1) { { a: 1, b: { c: [1, 2] } } }
        let(:hash2) { { a: 1, b: { c: [2, 1] } } }

        it "returns true" do
          FuzzyMatcher.equals?(hash1, hash2).should eq(true)
        end
      end

      context "that are not equal" do
        let(:hash1) { { a: 1, b: { c: [3, 2] } } }
        let(:hash2) { { a: 1, b: [1, 2] } }

        it "returns false" do
          FuzzyMatcher.equals?(hash1, hash2).should eq(false)
        end
      end
    end
  end
end
