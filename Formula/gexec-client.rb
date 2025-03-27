# frozen_string_literal: true

# Definition of the gexec-client formula
class GexecClient < Formula
  desc "Gexec: Client"
  homepage "https://gexec.eu"
  license "Apache-2.0"

  url "https://github.com/gexec/gexec/archive/v0.0.0.tar.gz"
  sha256 ""
  head "https://github.com/gexec/gexec.git", branch: "master"

  test do
    system bin / "gexec-client", "--version"
  end

  depends_on "go" => :build
  depends_on "go-task" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["SHA"] = "undefined"
    ENV["VERSION"] = if build.head?
                       Utils.git_short_head(length: 8)
                     else
                       url.split("/").last.gsub(".tar.gz", "").gsub("v", "")
                     end

    system "task", "be:generate", "build:client"
    bin.install "bin/gexec-client"
  end
end
