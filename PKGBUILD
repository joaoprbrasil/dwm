pkgname=dwm-nebula-neon-git
pkgver=1.0
pkgrel=1
pkgdesc="DWM fork with Nebula/Neon theme, vanitygaps, and systray patches."
arch=('x86_64')
url="https://github.com/joaoprbrasil/dwm"
license=('MIT')
depends=('libx11' 'libxft' 'libxinerama' 'fontconfig' 'freetype2')
makedepends=('git')
provides=('dwm')
conflicts=('dwm')
source=("git+https://github.com/joaoprbrasil/dwm.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/dwm"
}

build() {
  cd "$srcdir/dwm"
  make
}

package() {
  cd "$srcdir/dwm"
  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 wallpapers/wallpaper.jpg "$pkgdir/usr/share/backgrounds/nebula-wallpaper.jpg"
}
