class Gf2x < Formula
  desc "C/C++ software package containing routines for fast arithmetic in GF(2)[x]"
  homepage "https://gitlab.inria.fr/gf2x/gf2x"
  url "https://gitlab.inria.fr/gf2x/gf2x.git"
  version "1.3.99"
  sha256 "11bcf98b620c60c2ee3b4460b02b7be741f14cfdc26b542f22c92950926575e0"
  license "GPL-3.0-or-later"
  head "https://gitlab.inria.fr/gf2x/gf2x.git"

  depends_on "automake"
  depends_on "libtool"
  depends_on "texinfo"

  def install
    system "autoreconf", "-fvi"
    system "./configure", "--prefix=#{prefix}", "--enable-shared"
    system "make"
    system "make", "tune-lowlevel"
    system "make", "tune-toom"
    # system "make", "tune-fft" Skip this step, it errors out on some systems
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end
