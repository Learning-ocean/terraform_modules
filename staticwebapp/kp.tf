resource "aws_key_pair" "deployer" {
  key_name   = local.key_name
  public_key = file(var.key_path)
}