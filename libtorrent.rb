require 'formula'

class Libtorrent < Formula
  homepage 'http://libtorrent.rakshasa.no/'
  url 'http://libtorrent.rakshasa.no/downloads/libtorrent-0.13.2.tar.gz'
  sha256 'ed2f2dea16c29cac63fa2724f6658786d955f975861fa6811bcf1597ff8a5e4f'

  depends_on 'pkg-config' => :build
  depends_on 'libsigc++'
  depends_on 'xmlrpc-c'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--with-xmlrpc-c",
                          "--disable-dependency-tracking",
                          "--with-kqueue",
                          "--enable-ipv6"
    system "make"
    system "make install"
  end
end
