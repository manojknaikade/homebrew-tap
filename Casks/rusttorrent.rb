cask "rusttorrent" do
  version "0.13.3"
  sha256 "520bc0792312192037021c0f3ad333dbd960045b280fe0159b2d4494c81f9f3b"

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
