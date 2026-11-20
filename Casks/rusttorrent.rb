cask "rusttorrent" do
  version "0.13.1"
  sha256 "48f9ec164797177cc357e6937a26293332791c60e3db15a7d96fa50add1ccceb"

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
