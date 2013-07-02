require 'formula'

class RtorrentColor < Formula
  homepage 'http://libtorrent.rakshasa.no/'
  url 'http://libtorrent.rakshasa.no/downloads/rtorrent-0.9.2.tar.gz'
  sha256 '5c8f8c780bee376afce3c1cde2f5ecb928f40bac23b2b8171deed5cf3c888c3d'

  depends_on 'pkg-config' => :build
  depends_on 'libsigc++'
  depends_on 'libtorrent'
  depends_on 'xmlrpc-c'

  def patches
    ["https://gist.github.com/maman/5907001/raw/rtorrent-0.9.2_canvas_color.patch"]
  end

  def install
    args = ["--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}", "--with-xmlrpc-c"]
    if MacOS.version == :leopard
      inreplace 'configure' do |s|
        s.gsub! '  pkg_cv_libcurl_LIBS=`$PKG_CONFIG --libs "libcurl >= 7.15.4" 2>/dev/null`',
          '  pkg_cv_libcurl_LIBS=`$PKG_CONFIG --libs "libcurl >= 7.15.4" | sed -e "s/-arch [^-]*/-arch $(uname -m) /" 2>/dev/null`'
      end
    end
    system "./configure", *args
    system "make"
    system "make install"
  end
end
