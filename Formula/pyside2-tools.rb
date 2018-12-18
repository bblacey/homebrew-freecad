class Pyside2Tools < Formula
  desc "PySide development tools (pyuic and pyrcc)"
  homepage "https://wiki.qt.io/PySide2"
  url "http://code.qt.io/pyside/pyside-setup.git", :branch => "5.11.2"
  version "5.11.2"
  head "http://code.qt.io/pyside/pyside-setup.git", :branch => "5.11"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-freecad"
    cellar :any
    sha256 "60cddaffb89ef2a357d197149532cc08e239480cf5f4fdea5c1d40b0e005c77b" => :sierra
  end

  depends_on "cmake" => :build
  depends_on "python@2" => :recommended
  depends_on "python" => :optional
  depends_on "FreeCAD/freecad/pyside2"

  def install
    Language::Python.each_python(build) do |_python, version|
      mkdir "macbuild#{version}" do
        args = std_cmake_args
        args << "-DUSE_PYTHON_VERSION=#{version}"
        args << "../sources/pyside2-tools"

        system "cmake", *args
        system "make", "-j#{ENV.make_jobs}", "install"
      end
    end
  end
end
