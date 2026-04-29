data template_cloudinit_config name {
  gzip          = true
  base64_encode = true

  part {
    filename     = "filename"
    content_type = "text/cloud-config"
    content      = ""
  }
}
