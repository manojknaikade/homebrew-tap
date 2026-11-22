cask "rusttorrent" do
  version "0.14.0"
  sha256 "718d361cba82d3e9c519f647b8d14dd476171936858fb07e54707ba424ba59e3"

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
