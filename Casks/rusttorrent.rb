cask "rusttorrent" do
  version "0.14.1"
  sha256 "01c9bdc83e1a0ef051779c2bcced7d75a28282a894be902184dc45895b101863"

  url "https://github.com/manojknaikade/RustTorrent/releases/download/v#{version}/RustTorrent-#{version}-arm64.zip"
  name "RustTorrent"
  desc "Small, fast torrent client"
  homepage "https://github.com/manojknaikade/RustTorrent"

  depends_on arch: :arm64
  depends_on :macos

  app "RustTorrent.app"

  # The app is signed only locally, so macOS would refuse to open a downloaded copy.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/RustTorrent.app"]
  end

  zap trash: "~/Library/Application Support/RustTorrent"
end
