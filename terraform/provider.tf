terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
token     = "y0_AgAAAAAFH0HjAATuwQAAAADZ5ehT4TxT0HA5SeOiniPLTCJJ_hM2tR8"
cloud_id  = "b1g9g7r183chh7fal746"
folder_id = "b1gelkmoapvj75knumo4"
zone      = "ru-central1-a"
}
