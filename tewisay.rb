require 'formula'

class Tewisay < Formula
  homepage 'https://github.com/neeee/tewisay'
  url 'https://github.com/neeee/tewisay/archive/master.zip'
  sha256 '00632def976e16a6b710dc9020afe7996aa7ebea8bf0692ce807644f427610fe'

  head 'https://github.com/neeee/tewisay.git'

  depends_on 'go'
  depends_on 'asciidoc'
  depends_on 'cowsay' => :optional

  def install
    system "go build tewisay.go"
    bin.install 'tewisay'
  end
end
