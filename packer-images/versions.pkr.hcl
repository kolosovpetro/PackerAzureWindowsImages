packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = ">=2"
    }
    windows-update = {
      source  = "github.com/rgl/windows-update"
      version = ">=0.14.3"
    }
  }
}