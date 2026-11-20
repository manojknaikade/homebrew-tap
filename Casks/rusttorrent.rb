cask "rusttorrent" do
  version "0.12.1"
  sha256 "14f10911aae85192ec18a1c1e40cd77cba4e0883afe0e9807f5f27d17232685c"

  url "https://github.com/manojknaikade/RustTorrent/releases/download/v#{version}/RustTorrent-#{version}-arm64.zip"
  name "RustTorrent"
  desc "Small, fast torrent client"
  homepage "https://github.com/manojknaikade/RustTorrent"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "RustTorrent.app"

  # The app is signed only locally, so macOS would refuse to open a downloaded copy.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/RustTorrent.app"]
  end

  zap trash: "~/Library/Application Support/RustTorrent"
end
