require "danger/ci_source/support/find_repo_info_from_url"

RSpec.describe Danger::FindRepoInfoFromURL do
  describe "#call" do
    context "no match" do
      it "returns nil" do
        result = described_class.new("https://danger.systems").call

        expect(result).to be nil
      end
    end
  end

  context "GitHub" do
    it "https works" do
      result = described_class.new("https://github.com/torvalds/linux/pull/42").call

      expect(result).to have_attributes(
        slug: "torvalds/linux",
        id: "42"
      )
    end

    it "http with www works" do
      result = described_class.new("http://www.github.com/torvalds/linux/pull/42").call

      expect(result).to have_attributes(
        slug: "torvalds/linux",
        id: "42"
      )
    end
  end

  context "GitLab" do
    it "works with trailing slash" do
      result = described_class.new("https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/42/").call

      expect(result).to have_attributes(
        slug: "gitlab-org/gitlab-ce",
        id: "42"
      )
    end

    it "works with two trailing slashes" do
      result = described_class.new("https://gitlab.com/gitlab-org/gitlab-group/gitlab-ce/merge_requests/42/").call

      expect(result).to have_attributes(
        slug: "gitlab-org/gitlab-group/gitlab-ce",
        id: "42"
      )
    end
  end

  context "Bitbucket" do
    context "bitbucket.org" do
      it "works" do
        result = described_class.new("https://bitbucket.org/ged/ruby-pg/pull-requests/42").call

        expect(result).to have_attributes(
          slug: "ged/ruby-pg",
          id: "42"
        )
      end
    end

    context "bitbucket.com" do
      it "works with http + trailing slash" do
        result = described_class.new("http://www.bitbucket.com/ged/ruby-pg/pull-requests/42/").call

        expect(result).to have_attributes(
          slug: "ged/ruby-pg",
          id: "42"
        )
      end
    end
  end

  context "Bitbucket Server" do
    it "works" do
      result = described_class.new("https://tools.adidas-group.com/bitbucket/projects/MA/repos/ios-fanatics/pull-requests/1946").call

      expect(result).to have_attributes(
        slug: "MA/ios-fanatics",
        id: "1946"
      )
    end
<<<<<<< HEAD

=======
    
>>>>>>> bea8e4a44a1faa3bc5dd053dac5f51e3a77f0a2a
    it "works with http + trailing slash" do
      result = described_class.new("http://tools.adidas-group.com/bitbucket/projects/MA/repos/ios-fanatics/pull-requests/1946/").call

      expect(result).to have_attributes(
        slug: "MA/ios-fanatics",
        id: "1946"
      )
<<<<<<< HEAD
    end
  end
=======
    
    end
  end    
>>>>>>> bea8e4a44a1faa3bc5dd053dac5f51e3a77f0a2a
end
