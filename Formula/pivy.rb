class Pivy < Formula
  homepage "https://bitbucket.org/Coin3D/pivy/overview"
  url "https://bitbucket.org/Coin3D/pivy/get/d8c4fefe5a19954f23b6caff2931319976228b79.tar.gz"
  sha256 "43216e708ed51ded96f31116a22846aca53a16120cb7d7a9daf14296270dbb53"
  head "https://bitbucket.org/Coin3D/pivy", :using => :hg
  version "0.5.0-4b84e76"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-freecad"
    cellar :any
    sha256 "b0057a5d48ce3c7a95bc652c3cc966420fd5e1223bead57f2ec7347f915eb47e" => :sierra
  end

  depends_on "python" => :build
  depends_on "swig" => :build
  depends_on "FreeCAD/freecad/coin"

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
