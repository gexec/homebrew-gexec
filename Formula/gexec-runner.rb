# frozen_string_literal: true

# Definition of the gexec-runner formula
class GexecRunner < Formula
  desc "Gexec: UI"
  homepage "https://gexec.eu"
  license "Apache-2.0"

  url "https://github.com/gexec/gexec/archive/v0.0.0.tar.gz"
  sha256 ""
  head "https://github.com/gexec/gexec.git", branch: "master"

  test do
    system bin / "gexec-runner", "--version"
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

    system "task", "be:generate", "build:runner"
    bin.install "bin/gexec-runner"

    FileUtils.touch("gexec-runner.conf")
    etc.install "gexec-runner.conf"
  end

  def post_install
    (var / "gexec-runner").mkpath
  end

  service do
    run [opt_bin / "gexec-runner", "start"]
    environment_variables GEXEC_RUNNER_ENV_FILE: etc / "gexec-runner.conf"
    keep_alive true
    log_path var / "log/gexec-runner.log"
    error_log_path var / "log/gexec-runner.log"
  end
end
