# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Rwget < Formula
  desc ""
  homepage "https://github.com/iashraful/rwget-downloader"
  url "https://github.com/iashraful/rwget-downloader/archive/refs/tags/0.1.2.tar.gz"
  sha256 "05af3fd8425e5c4d6c476d1edd5f0aea52f29e52ac759cda9fa2bfcf2c66f9a2"
  license "MIT"
  depends_on "rust" => :build

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "cargo", "install", *std_cargo_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test rwget`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    assert_match "USAGE", shell_output("#{bin}/rwget --help")
  end
end
