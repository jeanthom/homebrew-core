class Openfpgaloader < Formula
  desc "Universal utility for programming FPGA"
  homepage "https://github.com/trabucayre/openFPGALoader"
  url "https://github.com/trabucayre/openFPGALoader.git",
    tag:      "v0.4.0",
    revision: "1dbbd34420e00070bd0f58e0a91a653e12a87b97"
  license "Apache-2.0"
  revision 1
  head "https://github.com/trabucayre/openFPGALoader.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libftdi"
  depends_on "libusb"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    version_output = shell_output("#{bin}/openFPGALoader -V 2>&1")
    assert_match "openFPGALoader v#{version}", version_output
  end
end
