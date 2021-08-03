# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Geoclue < Formula
  desc "GeoClue location framework"
  homepage ""
  url "https://github.com/freedesktop/geoclue/archive/refs/tags/0.12.99.tar.gz"
  sha256 "f198310f77d969f776d70649f505b90eb9d46f826ba77c3e573c086d989d6475"
  license "NOASSERTION"

  # depends_on "cmake" => :build
  depends_on "libtool"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "sudo", "ln", "-s", "/usr/local/bin/glibtoolize", "/usr/local/bin/libtoolize"
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test geoclue`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
