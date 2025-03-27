# frozen_string_literal: true

# Definition of the gexec-server formula
class GexecServer < Formula
  desc "Gexec: Server"
  homepage "https://gexec.eu"
  license "Apache-2.0"

  url "https://github.com/gexec/gexec/archive/v0.0.0.tar.gz"
  sha256 ""
  head "https://github.com/gexec/gexec.git", branch: "master"

  test do
    system bin / "gexec-server", "--version"
  end

  depends_on "go" => :build
  depends_on "go-task" => :build
  depends_on "node@22" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["SHA"] = "undefined"
    ENV["VERSION"] = if build.head?
                       Utils.git_short_head(length: 8)
                     else
                       url.split("/").last.gsub(".tar.gz", "").gsub("v", "")
                     end

    system "task", "fe:install", "fe:generate", "fe:build"
    system "task", "be:generate", "build:server"
    bin.install "bin/gexec-server"

    FileUtils.touch("gexec-server.conf")
    etc.install "gexec-server.conf"
  end

  def post_install
    (var / "gexec-server").mkpath
  end

  service do
    run [opt_bin / "gexec-server", "start"]
    environment_variables GEXEC_SERVER_ENV_FILE: etc / "gexec-server.conf"
    keep_alive true
    log_path var / "log/gexec-server.log"
    error_log_path var / "log/gexec-server.log"
  end
end
