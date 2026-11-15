cask "rusttorrent" do
  version "0.6.0"
  sha256 "8f41afad53700cf452c33663a541ee113664c3b467e0c6a5631987ef0471e749"

  url "https://github.com/manojknaikade/RustTorrent/releases/download/v#{version}/RustTorrent-#{version}-arm64.zip"
  name "RustTorrent"
  desc "Small, fast torrent client"
  homepage "https://github.com/manojknaikade/RustTorrent"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "RustTorrent.app"

  # The app is signed only locally, so macOS would refuse to open a downloaded copy.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/RustTorrent.app"]
  end

  zap trash: "~/Library/Application Support/RustTorrent"
end
