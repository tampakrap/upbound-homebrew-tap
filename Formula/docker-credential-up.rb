# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.19.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '133ae353cad228571aec5cd16ea82b932d3584e8b179498d099e3004599632d5'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '5502627b816bd28f4eb041fe7f66383e906d36567272f246f174e839b0add340'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '7ecffc86529b607fa66f2cad8c27ac7d0c776df5e468aad509b3629206424313'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '28785a67929f8494109979602aa1a3c53f13e6b7574d05248970a94c0083aa02'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '9aeb38e585471677b2f296852c207ccdf20877d5eccfca046b588d046dd167ed'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
