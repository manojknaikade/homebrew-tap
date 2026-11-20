cask "rusttorrent" do
  version "0.13.2"
  sha256 "57515a418b762f43f18c7d2cc8bcb4f0b3d350f48cb451b71b6eaf9f3903b3ba"

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
